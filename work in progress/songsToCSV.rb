# Started in Sex Nov  3 23:29:04 BRST 2017

require 'csv'
require 'find'
require 'pp'

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
ratings = raw_tags.select{|x| x.include?("POPM")}.map{|x| x.split("rating=").pop}
titles = raw_tags.select{|x| x.include?("(title):")}.map{|x| x.split("(title): ").pop}

# The idea is to call that program for every directory it crawls.
# It doesn't retrieve anything for files other than MP3 files.

pp ratings
pp titles

filtered_tag_hash = titles.zip(ratings)
pp filtered_tag_hash

filtered_tag_hash.each do |arr|
  pp "Title -> #{arr[0]}, rating #{arr[1].to_i/32}"
end
