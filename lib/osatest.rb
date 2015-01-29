require_relative 'osascript'

osascript <<-END
	tell application "Finder"
		display dialog "Hello"
	end tell
END
