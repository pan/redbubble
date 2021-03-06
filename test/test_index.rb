require_relative 'common'

module Redbubble
  class TestIndex < MiniTest::Test
    include Redbubble::Test

    def setup
      all = Redbubble::Works.new WORKS_FILE
      @works = all.works
      engine = Generator::Engine.new(@works, TEST_OUTPUT)
      @page = engine.index
    end

    def test_initialize
      assert_equal "index.html", @page.name
    end

    def test_update_thumnails_from
      @page.thumnails = []
      @page.update_thumnails_from(@works)
      assert_equal LIMIT, @page.thumnails.size
    end

    def test_thumnails
      assert_respond_to @page, 'thumnails'
    end

    def test_navigation
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
