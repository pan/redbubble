module Redbubble
  # The Anchor class is used to define html tag a and img
  class Anchor
    attr_accessor :title, :href

    # default +title+ and +href+ is " ", pass in new values to override them.
    # <a href="href">title</a> 
    # <img alt="title" src="href">
    def initialize(title = " ", href = " ")
      @title = title
      @href = href
    end

  end
end

