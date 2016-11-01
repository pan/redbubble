require_relative 'common'

module Redbubble
  class TestWork < MiniTest::Test
    include Redbubble::Test

    def setup
      @firstwork = (WORKS_SRC.css('work').first)
      @work = Redbubble::Work.new @firstwork
    end

    def test_update_filename_from
      @work.update_filename_from(@firstwork)
      assert_equal "162042.jpg", @work.filename
    end

  end
end
