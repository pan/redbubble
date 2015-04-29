module Redbubble
  module Image

    # the image url
    class URL
      attr_reader :small
    
      # get the small image url from +work_node+
      def initialize(work_node)
        set_small(work_node)
      end

      # parse the small image url from +work_node+
      def set_small(work_node)
        @small = work_node.css('url[type="small"]').text
      end
    end
  end
end
