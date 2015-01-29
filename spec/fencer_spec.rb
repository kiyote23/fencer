require 'spec_helper'
require 'appscript'
require 'sqlite3'
require 'etc'
require_relative '../lib/fencer'
require_relative '../lib/omnifocus'

describe Fencer do
	describe 'object' do
		test_file = File.new('input.txt', "r")
		test_object = Fencer.new(test_file)
		it 'has an array of strings' do
			expect(test_object.input_array).to be_an(Array)
		end
		it 'looks for array elements starting with fence delimiter' do
			test_object.find_fence
			expect(test_object.fence_start).to eq(2)
		end
		it 'looks for the ending fence delimiter' do
			expect(test_object.fence_end).to eq(6)
		end
		it  'copies text between fences to new array' do
			result = ["This is the third line.\n","this is the fourth line.\n", "This is the fifth line.\n"]
			expect(test_object.output_array).to eq(result)
		end
	end
	describe 'action processor' do
		test_file = File.new('input2.txt', "r")
		test_object = Fencer.new(test_file)
		it 'finds lines marked with "-"' do
			test_object.process_actions
			expect(test_object.action_array).to be_an(Array)
			expect(test_object.action_array.size).to eq(2)
		end
		it 'removes the dash from the start of the line' do
			test_object.process_actions
			test_object.action_array.each do |string| 
				expect(string[0]).to_not eq('-')
				expect(string[0]).to_not eq(' ')
			end
			expect(test_object.action_array[0].chars.first).to eq('T')
			expect(test_object.action_array[1].chars.first).to eq('T')
		end
		it 'sends the actions to Omnifocus' do
			count = test_object.inbox_count
			test_object.process_actions
			count2 = test_object.inbox_count
			expect(count2).to be > count
			expect(count2-count).to eq(2)
		end
	end
end
