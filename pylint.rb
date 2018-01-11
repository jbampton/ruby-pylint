#!/usr/bin/env ruby

# Ruby command line script that runs the Pylint python code linting tool.
# https://www.pylint.org/ against a whole directory recursively

#
def lint(src)
  Dir.glob("#{src}/**/*.py").map do |filename|
    # output filename for debugging
    puts filename
    puts `pylint "#{filename}"` unless filename.include? '/venv/'
  end
end

if ARGV[0].nil?
  STDOUT.puts 'Please provide the directory - /path/to/dir - to run pylint ' \
              'against or use . for the current directory.'
else
  lint(ARGV[0])
end