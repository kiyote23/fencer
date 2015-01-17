require 'spec_helper'
require_relative '../lib/fencer'

describe Fencer do
	describe 'object' do
		test_array = ["This is a new string.", "This is another string.", "<<< fence start", "This is a fourth string.", ">>> fence end", "This is a final string."]
		test_object = Fencer.new(test_array)
		it 'has an array of strings' do
			expect(test_object.input_array).to equal(test_array)
		end
		it 'looks for array elements starting with fence delimiter' do
			expect(test_object.fence_start).to eq(2)
		end
		it 'looks for the ending fence delimiter' do
			expect(test_object.fence_end).to eq(4)
		end
		it  'copies text between fences to new array' do
			output_array = ["This is a fourth string."]
			expect(test_object.output_array).to eq(output_array)
		end
	end
end
