require_relative 'common'

module Redbubble
  class TestPage < MiniTest::Test
    include Redbubble::Test

    def setup
      @page = Redbubble::Generator::Page.new
    end

    def test_initialize
      assert_respond_to @page, 'render'
    end

    def test_generate
      @page.name = "test_generation.html"
      @page.path = TEST_OUTPUT
      file = File.join(@page.path, @page.name)
      File.unlink file if File.exist? file
      Dir.mkdir @page.path unless Dir.exist? @page.path
      @page.generate
      assert File.exist? file
    end

    def test_setname
      @page.setname("a_model")
      assert_equal "a_model.html", @page.name
    end

    def test_mkname
      ret = @page.mkname("a_model")
      assert_equal "a_model.html", ret
    end

    def test_navigation
      assert_respond_to @page, 'navigation'
    end

    def test_mkvalid_char
      invalids = "a\0b/c*d\\e?f:g\"h|i<j>k "
      assert_equal 'a_b_c_d_e_f_g_h_i_j_k_', @page.mkvalid_char(invalids)
    end

  end
end
