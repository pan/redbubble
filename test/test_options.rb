require_relative 'common'

module Redbubble
  class TestOptions < MiniTest::Test
    include Redbubble::Test

    def setup
      @options = Redbubble::Options.parse(%w(-i works -o out))
    end

    def test_option_input
      assert @options[:works]
    end

    def test_option_output
      assert @options[:output]
    end

  end
end
