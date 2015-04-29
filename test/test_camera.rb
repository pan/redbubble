require_relative 'common'

module Redbubble
  class TestCamera < MiniTest::Test
    include Redbubble::Test
    def setup
      @firstwork = WORKS_SRC.css('work').first
      @camera = Redbubble::Camera.new @firstwork
    end

    def test_set_maker
      @camera.set_maker(@firstwork)
      assert_equal "NIKON CORPORATION", @camera.maker
    end

    def test_set_model
      @camera.set_model(@firstwork)
      assert_equal "NIKON D80", @camera.model
    end
  end
end
