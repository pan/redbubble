module Redbubble
  module Generator
    # camera maker(or make) page
    class Maker < Page
      # new a maker object with +cameras+ data which is created by the engine
      # for a +maker+, and write it to this +outdir+
      def initialize(cameras, maker, outdir)
        super()
        @path = outdir
        @title = maker
        setname(maker)
        update_navigation_from(cameras, maker)
        update_thumnails_from(cameras, maker)
      end

      # set the navigation for the +camera+ +maker+
      def update_navigation_from(cameras, maker)
        @navigation = [Anchor.new('Index', INDEX_PAGE)]
        cameras[maker].keys.each do |model|
          @navigation << Anchor.new(model, mkname(model))
        end
      end

      # set the thumnails for this +maker+. the data is read from +cameras+
      def update_thumnails_from(cameras, maker)
        return unless @thumnails.size < Redbubble::LIMIT
        cameras[maker].keys.each do |model|
          cameras[maker][model].each do |url|
            @thumnails << Anchor.new(model, url)
          end
        end
      end
    end
  end
end
