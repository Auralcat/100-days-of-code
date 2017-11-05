# Started in Sex Nov  3 23:29:04 BRST 2017

require 'csv'
require 'find'
require 'pp'

class Array
  def trim_string(str, sep=str)
    # Returns the last portion of the string in the element, split
    # in sep
    self.each do |elem|
      elem = elem.select{|x| x.include?(str)}.map{|x| x.split(sep).pop}
    end
    self
  end
end

def generateFileName()
    # Generates the CSV file's name from the folder name
    Dir.pwd.split("/").pop
end

pp "You're in #{Dir.pwd}"
# The structure of the CSV file is like this:
# song_number, track_title, rating (0 to 5)

# First we need to get the ratings you have issued already in MediaMonkey.
# We'll use a shell program called id3info for this.
raw_tags = `id3info *.mp3`.chop.split("\n")
ratings = raw_tags.trim_string("POPM", "rating=")
titles = raw_tags.trim_string("(title):")

# The idea is to call that program for every directory it crawls.
# It doesn't retrieve anything for files other than MP3 files.

pp ratings
pp titles

filtered_tag_hash = titles.zip(ratings)
pp filtered_tag_hash

filtered_tag_hash.each do |arr|
  pp "Title -> #{arr[0]}, rating #{arr[1].to_i/32}"
end
