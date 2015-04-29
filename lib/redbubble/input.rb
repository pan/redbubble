require 'nokogiri'

module Redbubble
  # load the input file
  class Input < Nokogiri::XML::Document
    # +xml_file+ : full path to an xml file
    def self.load(xml_file)
      parse File.read(xml_file)
    end
  end
end

