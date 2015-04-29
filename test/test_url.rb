require_relative 'common'

module Redbubble
  class TestImageURL < MiniTest::Test
    include Redbubble::Test

    def setup
      @firstwork = (WORKS_SRC.css('work').first)
      @urls = Redbubble::Image::URL.new @firstwork
    end

    def test_set_small
      @urls.set_small(@firstwork)
      expected_url = 
        "http://ih1.redbubble.net/work.31820.1.flat,135x135,075,f.jpg"
      assert_equal expected_url, @urls.small
    end

  end
end
