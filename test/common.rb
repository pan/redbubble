$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'nokogiri'
require 'redbubble'

module Redbubble
  module Test
    PROJECT_PATH = File.expand_path '../../', __FILE__
    TEST_DATA_DIR = File.join PROJECT_PATH, "test", "data" 
    TEST_OUTPUT = File.join TEST_DATA_DIR, "output"
    WORKS_FILE = File.join TEST_DATA_DIR, "works.xml" 
    WORKS_SRC = Nokogiri::XML::Document.parse File.read(WORKS_FILE)
  end
end

