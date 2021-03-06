#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# This buffer is intended to help me learn to work with CSV files
require 'csv'
require 'find'

# You can use Find.find to get the list of directories to crawl:
def get_album_dir_list(music_library_dir)
  dir_list = []
  Find.find(music_library_dir).each do |filepath|
    sanitize = filepath.split("/")
    dir_list << sanitize.slice(0, sanitize.length - 1).join("/")
  end

  # Removing duplicates and sorting
  dir_list.uniq!.sort!

  # Crawl the deepest directories found:
  longest_dir_length = dir_list.map{|x| x.split("/").length}.max - 3
  dir_list.select{|x| x.split("/").length == longest_dir_length}
end

def extract(raw_tags, target, sep=target)
  # Extracts the ratings from the output of id3info
  raw_tags.select{|x| x.include?(target)}.map{|x| (x.split(sep).pop)}
end

# Making sure we're inside the empty Ratings dir, and making sure
# it exists if it hasn't been created already
music_library_dir = Dir.home + "/Música"
Dir.chdir(music_library_dir)
Dir.mkdir("Ratings") if Dir.glob("Ratings") == []
puts "You're in #{Dir.pwd}"

dir_list = get_album_dir_list(music_library_dir)

dir_list.each do |dirpath|
  # File name should be the album's name, which is in the end of the dir names.
  copy_dir_name = dirpath
  album_name = copy_dir_name.split("/").pop
    CSV.open("#{music_library_dir}/Ratings/#{album_name}", "wb") do |csv_file|
    csv_file << ["Track Number", "Track Title", "Track Rating"]
    count = 1
    Dir.chdir(dirpath)
    puts "Crawling #{dirpath}..."

    Dir.glob("*\.{mp3,flac,m4a}").sort do |file|
      puts "Checking file #{dirpath}/#{file}"
      # puts `id3info "#{dirpath}/#{file}"`
      raw_tags = `id3info "#{dirpath}/#{file}"`.encode!('UTF-8', 'UTF-8', :invalid => :replace).split("\n")
      puts raw_tags
      # Extract the info you want here...
      rating = extract(raw_tags, "POPM", "rating=")
      track_title = file
      # After that...
      csv_file << [count, album_name, track_title, rating.pop.to_i/32]
      count += 1
    end
  end
  puts "CSV file for #{dirpath} was saved."
end

puts "Taking you home..."
Dir.chdir(Dir.home)
