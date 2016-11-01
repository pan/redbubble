module Redbubble
  module Generator
    # the index page class
    class Index < Page
      # new an index page object
      def initialize(cameras, outdir)
        super()
        @path = outdir
        @name = INDEX_PAGE
        @title = 'Index'
        update_navigation_from(cameras)
      end

      # set the thumnails with the data from all +works+, but there is a limit
      # in its total number.
      def update_thumnails_from(works)
        works[0...Redbubble::LIMIT].each do |work|
          @thumnails << Redbubble::Anchor.new(work.filename, work.urls.small)
        end
      end

      # set the navigation for the index page from +cameras+
      def update_navigation_from(cameras)
        cameras.keys.each do |maker|
          @navigation << Redbubble::Anchor.new(maker, mkname(maker))
        end
      end
    end
  end
end
