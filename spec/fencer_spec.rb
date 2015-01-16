require 'spec_helper'
require_relative '../lib/fencer'

describe Fencer do
	describe 'Fencer object' do
		it 'has an array of strings' do
			fencer_test_array = %w{"this is an array of strings",
				"We'll add another line here",
				"One more string"}
			fencer_test_object = Fencer.new(fencer_test_array)
			# fencer_test_object.input_array should equal fencer_test_array
		end
	end
	describe 'scan file' do
		it 'scans file line-by-line' do
			pending
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
