require 'spec_helper'
require_relative '../lib/fencer'

describe Fencer do
	describe 'object' do
		it 'has an array of strings' do
			fencer_test_array = %w{"this is an array of strings",
				"We'll add another line here",
				"One more string"}
			fencer_test_object = Fencer.new(fencer_test_array)
			# fencer_test_object.input_array should equal fencer_test_array
			# fencer_test_object.input_array.should equal(fencer_test_array)
			expect(fencer_test_object.input_array).to equal(fencer_test_array)
		end
		it 'looks for array elements starting with fence delimiter' do
			test_array = %w{"This is the first string.",
				"This is the second string.",
				"<<< This is the fence",
				"This is the last string."}
			test_object = Fencer.new(test_array)
			# test_object.fence_start.should equal(2)	
			expect(test_object.fence_start).to eq(2)
		end
		it 'looks for fence code' do
			pending
		end
	end
	describe 'create new array' do
		it  'copies text between fences to new array' do
			pending
		end
	end
	describe 'write new file' do
		it 'creates new text file from new array' do
			pending
		end
	end
end
