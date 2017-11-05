# Started in Sex Nov  3 23:29:04 BRST 2017

require 'csv'

def generateFileName()
    # Generates the CSV file's name from the folder name
    Dir.pwd.split("/").pop
end

# The structure of the CSV file is like this:
# song_number, track_title, rating (0 to 5)
puts "You're in #{Dir.pwd}"
puts generateFileName
