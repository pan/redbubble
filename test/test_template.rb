require_relative 'common'

module Redbubble
  class TestTemplate < MiniTest::Test
    include Redbubble::Test
    include Redbubble::Generator::Default

    def test_default_module
      assert_respond_to self, 'render'
    end

  end
end
