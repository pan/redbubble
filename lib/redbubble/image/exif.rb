module Redbubble
  module Image
    # the image format info, all the EXIF meta data goes here.
    class EXIF
      attr_reader :camera

      # +work_node+, a Nokogiri work node parsed from the input file
      def initialize(work_node)
        @camera = Redbubble::Camera.new work_node
      end
    end
  end
end
