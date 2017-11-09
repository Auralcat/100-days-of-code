# Started in Sex Nov  3 23:29:04 BRST 2017

require 'csv'

# Unused for now
# def generateFileName()
#     # Generates the CSV file's name from the folder name
#     Dir.pwd.split("/").pop
# end

def extract(raw_tags, target, sep=target)
  # Extracts the ratings from the output of id3info
  raw_tags.select{|x| x.include?(target)}.map{|x| (x.split(sep).pop)}
end

# The structure of the CSV file is like this:
# song_number, track_title, rating (0 to 5)

# First we need to get the ratings you have issued already in MediaMonkey.
# We'll use a shell program called id3info for this.

raw_tags = `id3info *.{mp3,flac,aac}`.chop.split("\n")
# sanitize_r = raw_tags.select{|x| x.include?("POPM")}
# ratings = sanitize_r.map{|x| x.split("rating=").pop}
# sanitize_t = raw_tags.select{|x| x.include?("(title):")}
# titles = sanitize_t.map{|x| x.split("(title): ").pop}

ratings = extract(raw_tags, "POPM", "rating=")
titles = extract(raw_tags, "(title):")

# The idea is to call that program for every directory it crawls.
# It doesn't retrieve anything for files other than MP3 files.

# NOTE: We can refactor all this later into a neat object
puts ratings
puts titles

filtered_tag_hash = titles.zip(ratings)
puts filtered_tag_hash

filtered_tag_hash.each do |arr|
  puts "Title -> #{arr[0]}, rating #{arr[1].to_i/32}"
end
