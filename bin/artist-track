#!/usr/bin/env ruby

require 'mp3info'
require 'fileutils'

dir = ARGV[0]
unless dir
  puts "artist-album DIRECTORY"
  exit 1
end
FileUtils.cd dir

Dir.entries(dir).each do |file|
   next if file !~ /.mp3$/ # skip files not ending with .mp3
   f = dir + "/" + file
   Mp3Info.open(f) do |mp3|      

     # strip out unix-hostile chars like colons, slashes, non-ASCII funtimes, etc.
     new_name = "#{mp3.tag.artist} - #{mp3.tag.title}.mp3".gsub(/[^a-zA-Z0-9_\.+ '-]/, '')
     if file != new_name
       puts new_name
       begin
         FileUtils.mv f, new_name
       rescue
       end
     end
   end
end

