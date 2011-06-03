# Scans the tree from the current directory looking for mp3 files and if they have no attached picture looks for Folder.jpg or
# folder.jpg in the same folder as the mp3 and if found adds it to the mp3.

require 'rubygems'
require 'id3lib'

cover = {
  :id          => :APIC,
  :mimetype    => 'image/jpeg',
  :picturetype => 3,
  :description => 'Album art',
  :textenc     => 0,
  :data        => nil
}

def determine_folder_jpg path
  %w(folder.jpg Folder.jpg).each do |jpg|
    jpg_path = File.join(File.dirname(path), jpg)
    return jpg_path if File.exists? jpg_path
  end
  nil
end

Dir['**/*.mp3'].each do |path|
  tag = ID3Lib::Tag.new(path)
  if tag.frame(:APIC).nil?
    folder_jpg = determine_folder_jpg path
    if folder_jpg
      cover[:data] = File.read folder_jpg
      tag << cover
      tag.update!
      puts path + ' updated'
    else
      puts "No folder.jpg for #{path}"
    end
  end
end

