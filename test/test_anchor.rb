require_relative 'common'

module Redbubble
  class TestAnchor < MiniTest::Test
    include Redbubble::Test

    def setup
      @anchor = Anchor.new
    end

    def test_initialize
      assert_respond_to @anchor, 'href'
    end

  end
end

