require_relative 'common'

module Redbubble
  class TestImageEXIF < MiniTest::Test
    include Redbubble::Test

    def setup
      firstwork = WORKS_SRC.css('work').first
      @exif = Image::EXIF.new firstwork
    end

    def test_initialize
      assert_respond_to @exif, 'camera'
    end

  end
end

