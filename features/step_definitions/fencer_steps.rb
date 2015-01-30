Given /^I have a text file$/ do
	@test_file = File.new('input.txt', "r")
end

When /^I run the processor$/ do
	@test_processor = Fencer.new(@test_file)
end

Then /^it should move action items to Omnifocus$/ do
	@test_processor.process_actions
end

Then /^it should move fenced text to new text files$/ do
	@test_processor.new_fence
end

Then /^it should append text to existing text files$/ do
	# @test_processor.mend_fences
	pending
end

Then /^it should create a new note in Evernote with all content$/ do
	# @test_processor.archive_to_evernote
	pending
end

Then /^it should move the original to the Archive$/ do
	pending
end
