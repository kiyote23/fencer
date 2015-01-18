#!/usr/bin/env ruby
require_relative 'lib/fencer.rb'

input_file = ARGV[0]
input_buffer = []

File.open(input_file, "r").each do |line|
	input_buffer << line
end

fence_object = Fencer.new(input_buffer)

File.open("output.txt", "w") do |f|
	fence_object.output_array.each do |line|
		f.puts line
	end
end
