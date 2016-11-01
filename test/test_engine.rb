require_relative 'common'

module Redbubble
  class TestEngine < MiniTest::Test
    include Redbubble::Test

    def setup
      all = Redbubble::Works.new WORKS_FILE
      @works = all.works
      @engine = Generator::Engine.new(@works, TEST_OUTPUT)
      @cameras = @engine.cameras
      @maker = "Canon"
    end

    def test_init
      assert @engine.cameras
    end

    def test_update_cameras_from
      assert @cameras[@maker].keys
    end

    def test_add_url
      @model = "Canon EOS 400D DIGITAL"
      url = "http://ih1.redbubble.net/work.777577.1.flat,135x135,075,f.jpg"
      assert_equal url, @cameras[@maker][@model][0]
    end

    def test_set_index
      assert_operator @engine.index.thumnails.size, :>, 0
    end

    def test_update_makers
      assert_operator @engine.makers.size,  :>, 0
    end

    def test_update_models
      assert_operator @engine.models.size,  :>, 0
    end

    def test_initialize
      assert_instance_of Redbubble::Generator::Engine, @engine
    end

    def test_run
      file = File.join TEST_OUTPUT, "FinePix_S6500fd.html"
      File.unlink file if File.exists? file
      @engine.run
      assert File.exists? file
    end

  end
end
