mp3tools
=============================

Some Ruby scripts to batch process MP3 tags. Run them at the root of the folder you wish to
process.

e.g.

    ~/Music $ ruby ~/mp3tools/addart.rb

* addart.rb - Attaches folder.jpg (if it exists) to MP3s that are missing album art
* artclean.rb - Removes Windows Media AlbumArt JPGs


Usage
-----------------------------

mp3tools uses id3lib-ruby which requires some packages

For Ubuntu:

    sudo aptitude install libid3-dev ruby-dev g++

For other OSs see the id3lib install page:

<http://id3lib-ruby.rubyforge.org/doc/files/INSTALL.html>

Then install id3lib (for Windows this is the only step)

    sudo gem install id3lib-ruby

