# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
directories %w(lib spec )

## Uncomment to clear the screen before every task
clearing :on

guard :rspec, cmd: 'rspec --color --format doc' do
	# watch /lib/ files
	watch(%r{^lib/(.+).rb$}) do |m|
		"spec/#{m[1]}_spec.rb"
	end

	# watch /spec/ files
	watch(%r{^spec/(.+).rb$}) do |m|
		"spec/#{m[1]}.rb"
	end
end

## Guard internally checks for changes in the Guardfile and exits.
## If you want Guard to automatically start up again, run guard in a
## shell loop, e.g.:
##
##  $ while bundle exec guard; do echo "Restarting Guard..."; done
##
## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), the you will want to move the Guardfile
## to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"
