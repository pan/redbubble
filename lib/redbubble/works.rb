module Redbubble
  # get all works
  class Works
    attr_reader :works

    # new the works from +xml_input+, a string file name
    def initialize(xml_input)
      @works = []
      doc = Redbubble::Input.load(xml_input)
      worknodes = doc.css('work')
      update_works_from(worknodes)
    end

    # create works array with all work object from Nokogiri +worknodes+
    def update_works_from(worknodes)
      worknodes.each do |worknode|
        work = Redbubble::Work.new worknode
        @works << work
      end
    end
  end
end
