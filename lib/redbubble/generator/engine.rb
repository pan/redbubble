require 'fileutils'

module Redbubble
  module Generator
    # The Engine generate the data that is used to populate all the output html
    # files.
    # It is using multiple threads while rendering and writing the html.
    class Engine
      attr_reader :cameras, :index, :makers, :models

      # +works+ is parsed result from the input xml containing the necessary
      # data only
      # +outdir+, write to this directory, the code will create it if not exist.
      def initialize(works, outdir)
        FileUtils.mkdir_p(outdir)
        @cameras = {}
        @makers = []
        @models = []
        init(works)
        set_index(works, outdir)
        update_makers(outdir)
        update_models(outdir)
      end

      # run the engine
      def run
        threads = [Thread.new { @index.generate }]
        (@makers + @models).each do |mm|
          threads << Thread.new do
            mm.generate
          end
        end
        threads.each(&:join)
      end

      private

      # +works+ is parsed result from the input xml containing the necessary
      # data only
      # iterate +works+ and call the method to set the hash +cameras+
      def init(works)
        works.each do |work|
          update_cameras_from(work)
        end
      end

      # populate the hash +cameras+ with the data from +work+ object which is
      # an instance of Redbubble::Work
      def update_cameras_from(work)
        camera = work.exif.camera
        return if add_url(work)
        @cameras[camera.maker][camera.model] << work.urls.small
      end

      # init the hash +cameras+ with the data from +work+ when it is not
      # inserted into it yet, it adds new url.
      def add_url(work)
        camera = work.exif.camera
        unless @cameras.key?(camera.maker) && @cameras[camera.maker]
               .key?(camera.model)
          @cameras[camera.maker] = { camera.model => [work.urls.small] }
        end
      end

      # +works+ is parsed result from the input xml including all works
      # +outdir+, the dir to output the index file
      # new the +@index+
      def set_index(works, outdir)
        @index = Redbubble::Generator::Index.new(@cameras, outdir)
        @index.update_thumnails_from(works)
      end

      # +outdir+, the dir to output the camera makers files
      # set the +@makers+
      def update_makers(outdir)
        @cameras.keys.each do |maker|
          maker_page = Redbubble::Generator::Maker.new(cameras, maker, outdir)
          @makers << maker_page
        end
      end

      # +outdir+, the dir to output the camera maker models files
      # set the +@models+
      def update_models(outdir)
        @cameras.keys.each do |maker|
          @cameras[maker].keys.each do |model|
            model_page = Redbubble::Generator::Model
                         .new(maker, model, @cameras[maker][model], outdir)
            @models << model_page
          end
        end
      end
    end
  end
end
