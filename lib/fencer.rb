require "fencer/version"

class Fencer
	attr_accessor :input_array, :fence_start
	def initialize(input_array)
		@input_array = input_array
		@fence_start = find_fence(input_array)
	end

	def find_fence(input_array)
	end
end
