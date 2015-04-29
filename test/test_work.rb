require_relative 'common'

module Redbubble
  class TestWork < MiniTest::Test
    include Redbubble::Test

    def setup
      @firstwork = (WORKS_SRC.css('work').first)
      @work = Redbubble::Work.new @firstwork
    end

    def test_set_filename
      @work.set_filename(@firstwork)
      assert_equal "162042.jpg", @work.filename
    end

  end
end
