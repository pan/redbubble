require_relative 'common'

module Redbubble
  class TestCamera < MiniTest::Test
    include Redbubble::Test
    def setup
      @firstwork = WORKS_SRC.css('work').first
      @camera = Redbubble::Camera.new @firstwork
    end

    def test_setmaker
      @camera.setmaker(@firstwork)
      assert_equal "NIKON CORPORATION", @camera.maker
    end

    def test_setmodel
      @camera.setmodel(@firstwork)
      assert_equal "NIKON D80", @camera.model
    end
  end
end
