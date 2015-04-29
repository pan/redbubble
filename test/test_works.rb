require_relative 'common'

module Redbubble
  class TestWorks < MiniTest::Test
    include Redbubble::Test

    def setup
      @allnodes = Redbubble::Works.new WORKS_FILE
    end

    def test_initialize
      assert @allnodes.works
    end

    def test_set_works
      assert_operator @allnodes.works.size, :>, 0
    end

  end
end
