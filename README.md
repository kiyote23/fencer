# Fencer

Fencer is a simple ruby script to scan through text files and look for "fenced" blocks of text. These blocks are then copied to new files based on parameters set up in the script.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fencer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fencer

## Usage

In the input text file, mark the portion you wish to put into another text file with the fences, "<<<" for the starting fence, and ">>>" for the ending fence.

execute:

	$ ruby fence_script.rb input.txt

substituting input.txt for your text file. The fence_script will create a new text file, output.txt with the marked off portion.

## Contributing

1. Fork it ( https://github.com/kiyote23/fencer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
