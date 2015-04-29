require_relative 'common'

module Redbubble
  class TestSetting < MiniTest::Test
    include Redbubble::Test

    def test_project_path
      assert Redbubble::PROJECT_PATH
    end

    def test_limit
      assert Redbubble::LIMIT
    end

  end
end

