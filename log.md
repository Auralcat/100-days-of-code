# 100 Days Of Code - Log

### Day 0: Qui Nov  2 21:27:38 BRST 2017

**Today's Progress**: Created functions in Emacs Lisp to activate linum and
  column-number modes for source code files only.

**Thoughts**: I'm learning Elisp without even realizing it! :O

**Link to work**: [init.el](https://github.com/Auralcat/my-dotfiles/blob/master/.emacs.d/init.el)

### Day 1: Sex Nov  3 23:18:55 BRST 2017

**Today's Progress**: Didn't do much today. There's this project I started last
  year in Python for catalogging the ratings of my music collection, which
  spans a couple hundred GBs. I was learning how to use the 'os' module at
  the time, now I'm considering changing it to Ruby.

**Thoughts**: Now I got more knowledge and I might be able to finish this.
  What I want is to generate a CSV file like so:

  "track_number", "track_title", "rating"

  File name will be the name of the folder the music files are in.
  Gotta crawl a lot of subdirectories and catalog everything.

**Link to work**: [Original Py file](https://github.com/Auralcat/100-days-of-code/blob/master/scripts/songsToCSV.py)
                  [Ruby file](https://github.com/Auralcat/100-days-of-code/blob/master/scripts/songsToCSV.rb)

### Day 2: Sáb Nov  4 23:56:16 BRST 2017

**Today's Progress**: Fixed the links in the repo, for some reason I couldn't
  get my folder to be recognized when I named it "scripts".

**Thoughts**: -

### Day 3: Dom Nov 5

**Today's Progress**: Outlined the roadmap for the script:
  - Read the ID3 tags of the mp3 files
  - Copy the POPM tag info into a CSV file in the "rating" field

  Also learned how to work with files and directories in Ruby.

**Challenges**:
  - Popularimeter tag isn't a standard
  - FLAC files don't hold ID3 tags
  - Not all the files have tags (or even correct ones)

**Thoughts**: I'm using id3info to get the tags from the files, Ruby actually
  works well for that by calling the command like `this`.  I found it easy to
  extract the info from the string as well, with map() and split(), but this can
  be done in Python too.

**Link to work**: [Original Py file](https://github.com/Auralcat/100-days-of-code/blob/master/scripts/songsToCSV.py)
                  [Ruby file](https://github.com/Auralcat/100-days-of-code/blob/master/scripts/songsToCSV.rb)

### Day 4: Seg Nov  6 20:14:41 BRST 2017

**Today's Progress**: Took a detour from the main project and ended up porting
  the Fairyfloss color theme from @sailorhg to Emacs, after adjusting the
  version proposed by @IrIna.

**Thoughts**: I could do a Vim port too, if there isn't one already. It'll go
  much faster, I'm sure of that.
  Aaaaand, more sidetracking. I like the end result though :)
  Another benefit was that I found a way to toggle transparency in the
  terminal window without having to use the mouse.

**Link to work**: [Elisp theme file](https://github.com/Auralcat/fairyfloss/blob/gh-pages/fairyfloss-theme.el)

### Day 5: Ter Nov  7 23:51:06 BRST 2017

**Today's Progress**: Continued to fiddle with songsToCSV.rb, learned how to
  work with directories and files, tuned the Fairyfloss theme.

**Thoughts**: There's no os.walk() method in Ruby.

**Link to work**:[Scratch file](https://github.com/Auralcat/100-days-of-code/blob/master/scripts/scratch.rb)

### Day 6: Qua Nov  8

**Today's Progress**: Outlined the process to grab the information from the
  music files spread throughout the library. Had some trouble with the
  Dir.glob() method when using braces to match MP3, FLAC and M4A files.

**Thoughts**: You can pass a block to the Dir.glob() method, instead of
  using it to store the matches in an array.

**Link to work**: [Scratch file](https://github.com/Auralcat/100-days-of-code/blob/master/scripts/scratch.rb)
