module Redbubble
  module Generator
    # the model page class
    class Model < Page
      # new a model object for a +maker+ +model+ with it's +urls+, write to
      # +outdir+
      def initialize(maker, model, urls, outdir)
        super()
        @path = outdir
        @title = model
        @name = setname(model)
        update_navigation_from(maker)
        update_thumnails_from(model, urls)
      end

      # set the navigation for this a +maker+ model
      def update_navigation_from(maker)
        @navigation = [Anchor.new('Index', INDEX_PAGE)]
        @navigation << Anchor.new(maker, mkname(maker))
      end

      # set the thumnails for this +model+ with its +urls+
      def update_thumnails_from(model, urls)
        urls.each do |url|
          @thumnails << Anchor.new(model, url)
        end
      end
    end
  end
end
