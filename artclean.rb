# Removes Windows Media AlbumArt*.jpg files
require 'fileutils'

count = 0
Dir['**/AlbumArt*.jpg'].each do |albumart_jpg|
  FileUtils.rm albumart_jpg
  count += 1
end

puts "Removed #{count} AlbumArt files"

