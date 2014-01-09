#!/usr/bin/env ruby

require 'fileutils'

unless ARGV[0]
  exit 1
end

if File.directory? ARGV[0]
  puts "it's a dir"
  FileUtils.cd ARGV[0]
  puts `ls`
end
