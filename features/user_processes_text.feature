Feature: User processes file

	As a user
	I want to process a file
	To extract the useful bits and start new jobs
	
	Scenario: process file
		Given I have a text file
		When I run the processor
		Then it should move action items to Omnifocus
		And it should move fenced text to new text files
		And it should append text to existing text files
		And it should create a new note in Evernote with all content
		And it should move the original to the Archive