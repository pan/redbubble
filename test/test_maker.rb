require_relative 'common'

module Redbubble
  class TestMaker < MiniTest::Test
    include Redbubble::Test

    def setup
      all = Redbubble::Works.new WORKS_FILE
      @works = all.works
      engine = Generator::Engine.new(@works, TEST_OUTPUT)
      @maker = "Canon"
      @cameras = engine.cameras
      @page = Generator::Maker.new(@cameras, @maker, TEST_OUTPUT)
    end

    def test_initialize
      assert_equal "Canon.html", @page.name
    end

    def test_set_thumnails
      @page.thumnails = []
      @page.set_thumnails(@cameras, @maker)
      assert_operator Redbubble::LIMIT, :>=, @page.thumnails.size
    end

    def test_thumnails
      assert_respond_to @page, 'thumnails'
    end

    def test_set_navigation
      @page.navigation = []
      @page.set_navigation(@cameras, @maker)
      assert_operator @page.navigation.size, :>, 0
    end

    def test_generate
      file = File.join(@page.path, @page.name)
      File.unlink file if File.exists? file
      Dir.mkdir @page.path unless Dir.exists? @page.path
      @page.generate
      assert File.exists? file
    end

    def test_name
      assert_respond_to @page, 'name'
    end

  end
end
