require 'spec_helper'
require_relative '../lib/fencer'

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

	describe "fence mender" do
		test_file = File.new('input2.txt', "r")
		test_object = Fencer.new(test_file)
		test_object.find_fence
		it 'identifies location tags' do
			expect(test_object.location_tag).to eq('test')
		end
		it 'determines output file from tag' do
			expect(test_object.destination_index).to eq('test/index.txt')
		end
		it 'appends text to output file' do
			count1 = 0
			File.open('test/index.txt', "r").each do |line|
				count1 += 1
			end
			test_object.mend_fences
			count2 = 0
			File.open('test/index.txt', "r").each do |line|
				count2 += 1
			end
			expect(count2).to be > count1
		end
	end
end
