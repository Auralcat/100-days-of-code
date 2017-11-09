# -*- coding: utf-8 -*-
# For jotting down ideas

require 'find'

# Raw Find object:
puts Find.find(Dir.home + "/Música")

# How to walk through directories in Ruby (using the Find core module)
# Find.find(Dir.home + "/Música") do |f|
#   # Print file and path to screen
#   puts "#{f} is a #{f.class}"
#   puts f
# end

# There's also this...
# Dir.open(Dir.home + "/Música").each do |filename|
#     next if File.directory?(filename)
#     puts "This is file #{filename}, data type #{filename.class}"
# end

# You can use Find.find to get the list of directories to crawl:
dir_list = []
Find.find(Dir.home + "/Música").each do |filepath|
  # Skip files
  sanitize = filepath.split("/")
  dir_list << sanitize.slice(0, sanitize.length - 1).join("/")
end

dir_list.uniq!.sort!

# Crawl the deepest directories found:
longest_dir_length = dir_list.map{|x| x.split("/").length}.max - 3
puts dir_list.select{|x| x.split("/").length == longest_dir_length}

dir_list.each do |dirpath|
  puts "Checking directory #{dirpath}"
  # You need to change to the directories for glob() to work.
  # If you do this, remember to go back to the starting dir!
  Dir.chdir(dirpath)

  # You can pass a block to Dir.glob!
  Dir.glob('*\.{mp3,flac,m4a}') {|match| puts match}

  # This works independently of location because you're just
  # dealing with strings, and this is similar to Python's
  # with() as syntax
  # Dir.open(dirpath).each do |filepath|
  #   next if File.directory?(filepath)
  #   puts filepath
  # end
end
