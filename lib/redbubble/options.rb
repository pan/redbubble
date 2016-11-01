require 'optparse'

module Redbubble
  # command line options parser
  class Options
    def initialize
      @options = {}
    end

    # class method parse command line +args+
    def self.parse(args)
      new.parse(args)
    end

    # command line arguments +args+ parser, it will make sure the required
    # options are provided. Otherwise, it shows the help.
    def parse(args)
      optparser = new_option_parser
      optparser.parse!(args)
      abort_missing_options(optparser)
      @options
    end

    private

    def new_option_parser
      OptionParser.new do |opts|
        opts.banner = "Usage: #{opts.program_name} <options>"
        opt_work(opts)
        opt_output(opts)
        opt_tail(opts)
      end
    end

    def opt_work(opts)
      opts.on('-i', '--input works.xml',
              'Full path to the works file') do |opt_works|
        @options[:works] = opt_works
      end
    end

    def opt_output(opts)
      opts.on('-o', '--output directory',
              'Output to this directory') do |opt_output|
        @options[:output] = opt_output
      end
    end

    def opt_tail(opts)
      opts.on_tail('-h', '--help', 'Show this help message') do
        puts opts
        exit
      end
    end

    def abort_missing_options(optparser)
      abort optparser.help if @options.empty?
      abort 'Option --input is required'  unless @options[:works]
      abort 'Option --output is required' unless @options[:output]
    end
  end
end
