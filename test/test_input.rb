require_relative 'common'

module Redbubble
  class TestInput < MiniTest::Test
    include Redbubble::Test

    def test_load
      loaded = Redbubble::Input.load(WORKS_FILE)
      assert_respond_to loaded, 'css'
    end

  end
end
