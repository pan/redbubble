#!/usr/bin/env ruby

require_relative 'lib/redbubble'

options = Redbubble::Options.parse(ARGV)
all = Redbubble::Works.new options[:works]

engine = Redbubble::Generator::Engine.new all.works, options[:output]
engine.run
