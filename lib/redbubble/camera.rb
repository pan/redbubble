module Redbubble

  # The Camera now has two properties, +maker+ and +model+. Extend this class
  # to support more attributes if needed.
  class Camera
    attr_reader :maker, :model

    # +work_node+ is Nokogiri work node parsed from works.xml
    def initialize(work_node)
      set_maker(work_node)
      set_model(work_node)
    end

    # parse and set property maker, set it to "unknown_maker" if not found
    # +work_node+ is Nokogiri work node parsed from works.xml
    def set_maker(work_node)
      @maker = work_node.css('exif make').text
      @maker = "unknown_maker" if @maker.empty?
    end

    # parse and set property model, set it to "unknown_model" if not found
    # +work_node+ is Nokogiri work node parsed from works.xml
    def set_model(work_node)
      @model = work_node.css('exif model').text
      @model = "unknown_model" if @model.empty?
    end
  end

end
