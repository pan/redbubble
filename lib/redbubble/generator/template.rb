require 'erb'

module Redbubble
  # output files generator module
  module Generator
    # "output.html.erb" is the default template for all generated pages
    output_template = 'output.html.erb'
    filename = File.join(Redbubble::PROJECT_PATH, 'template', output_template)
    @erb = ERB.new(File.read(filename))
    @erb.filename = filename
    Default = @erb.def_module 'render(title, thumnails, navigation)'
  end
end
