require "fencer/version"

class Fencer
	attr_accessor :input_array, :fence_start, :fence_end, :output_array
	def initialize(input_array)
		@input_array = input_array
		find_fence(input_array)
	end

	def find_fence(input_array)
		input_array.each.with_index do |string, index|
			if string =~ /<<</i 
				self.fence_start = index
			elsif string =~ />>>/i
				self.fence_end = index
			end
		end
		self.output_array = input_array[self.fence_start+1...self.fence_end].to_a
	end
end
