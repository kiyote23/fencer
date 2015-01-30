require_relative "fencer/version"

class Fencer
	attr_accessor :input_array, :fence_start, :fence_end, :output_array, :action_array
	def initialize(input_file)
		@input_array = []
		@action_array = []
		File.open(input_file, "r").each do |line|
		@input_array << line 
		end
		# find_fence(input_array)
	end

	def find_fence
		input_array.each.with_index do |string, index|
			if string =~ /<<</i 
				self.fence_start = index
			elsif string =~ />>>/i
				self.fence_end = index
			end
		end
		self.output_array = input_array[self.fence_start+1...self.fence_end].to_a
	end

	def process_actions
		input_array.each do |string|
			if string =~ /^-/i
				string[0] = ''
				if string[0] == ' '
					string[0] = ''
				end
				action_array << string
			end
		end
		action_array.each do |string|
			system "osascript lib/OF_inbox_add.scpt \"#{string}\""
		end
	end

	def inbox_count
		# count = osascript <<-END
		# 	tell application "OmniFocus"
		# 		tell default document
		# 			set incomplete to every inbox task where completed is false
		# 			count incomplete
		# 		end tell
		# 	end tell
		# 	return incomplete
		# END
		# return count
		# app("Finder").document.inbox_task.count.get
		`osascript lib/OF_inbox_count.scpt`.chomp.to_i
	end

	def mend_fences
	end

	def archive_to_evernote
	end

end
