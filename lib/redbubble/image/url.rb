module Redbubble
  module Image
    # the image url
    class URL
      attr_reader :small

      # get the small image url from +work_node+
      def initialize(work_node)
        update_small_from(work_node)
      end

      # parse & set the small image url from +work_node+
      def update_small_from(work_node)
        @small = work_node.css('url[type="small"]').text
      end
    end
  end
end
