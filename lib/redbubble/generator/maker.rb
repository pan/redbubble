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
        set_name(maker)
        set_navigation(cameras, maker)
        set_thumnails(cameras, maker)
      end

      # set the navigation for the +camera+ +maker+
      def set_navigation(cameras, maker)
        @navigation = [ Anchor.new("Index", INDEX_PAGE) ]
        cameras[maker].keys.each { |model|
          @navigation << Anchor.new(model, mkname(model))
        }
      end

      # set the thumnails for this +maker+. the data is read from +cameras+
      def set_thumnails(cameras, maker)
        cameras[maker].keys.each { |model|
          cameras[maker][model].each { |url|
            return if @thumnails.size > Redbubble::LIMIT
            @thumnails << Anchor.new(model, url)
          }
        }
      end

    end
  end
end

