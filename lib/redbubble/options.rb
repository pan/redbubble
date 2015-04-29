require 'optparse'

module Redbubble
  class Options

    # command line arguments +args+ parser, it will make sure the required
    # options are provided. Otherwise, it shows the help.
    def self.parse(args)
      options = {}
      optparser = OptionParser.new do |opts|
        opts.banner = "Usage: #{opts.program_name} <options>"

        opts.on("-i", "--input works.xml", 
                "Full path to the works file") do |opt_works|
          options[:works] = opt_works
        end

        opts.on("-o", "--output directory",
                "Output to this directory") do |opt_output|
          options[:output] = opt_output
        end

        opts.on_tail("-h", "--help", "Show this help message") do
          puts opts
          exit
        end

      end

      optparser.parse!(args)
      abort optparser.help() if options.empty?
      abort "Option --input is required"    unless options[:works]
      abort "Option --output is required"   unless options[:output]
      options
    end

  end
end
