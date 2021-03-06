require_relative 'common'

module Redbubble
  class TestModel < MiniTest::Test
    include Redbubble::Test

    def setup
      @maker = "Canon"
      @model = "Canon EOS 400D DIGITAL"
      @url = ["http://ih1.redbubble.net/work.777577.1.flat,135x135,075,f.jpg"]
      @page = Generator::Model.new(@maker, @model, @url, TEST_OUTPUT)
    end

    def test_initialize
      assert_equal @model, @page.title
    end

    def test_update_thumnails_from
      @page.thumnails = []
      @page.update_thumnails_from(@model, @url)
      assert Redbubble::LIMIT >= @page.thumnails.size
    end

    def test_thumnails
      assert_respond_to @page, 'thumnails'
    end

    def test_update_navigation_from
      @page.navigation = []
      @page.update_navigation_from(@maker)
      assert_operator @page.navigation.size, :>, 0
    end

    def test_generate
      file = File.join(@page.path, @page.name)
      File.unlink file if File.exist? file
      Dir.mkdir @page.path unless Dir.exist? @page.path
      @page.generate
      assert File.exist? file
    end

    def test_name
      assert_respond_to @page, 'name'
    end

  end
end
