module Redbubble
  module Generator
    # the parent class for html page
    class Page
      include Redbubble::Generator::Default
      attr_accessor :path, :name
      attr_accessor :title, :navigation, :thumnails

      # new a page
      def initialize
        @path = File.join Redbubble::PROJECT_PATH, "out"
        @title = " "
        @navigation = []
        @thumnails = []
      end

      # generate the page
      def generate
        file = File.new File.join(@path, @name), 'w+'
        file.print render(@title, @thumnails, @navigation)
        file.close
      end

      # set the page file name
      def set_name(name)
        @name = mkname(name)
      end

      # add file extention ".html" and some udpates to ensure it is safe to be
      # used as a file name
      def mkname(name)      
        mkvalid_char(name) + ".html"
      end

      # some chars are invalid in different file systems, convert them to '_'
      # for all of them
      def mkvalid_char(name)
        name.gsub /[\s[^\w\d]]/, '_'
      end

    end
  end
end
