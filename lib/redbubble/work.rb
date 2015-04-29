module Redbubble
  # the work class
  class Work
    attr_reader :urls, :exif, :filename

    # new a work with +work_node+ which is from the input file
    def initialize(work_node) 
      @urls = Redbubble::Image::URL.new work_node
      @exif = Redbubble::Image::EXIF.new work_node
      set_filename(work_node)
    end

    # get and set the filename from this +work_node+
    def set_filename(work_node)
      @filename = work_node.css('filename').text
    end

  end

end

