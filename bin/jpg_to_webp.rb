#!/Users/jm3/.rbenv/shims/ruby

require 'mini_magick'
require 'pry'
require 'English'

puts `pwd`

puts ARGV.inspect
puts $PROGRAM_NAME.inspect
puts $ERROR_POSITION.inspect

ARGV.each do |image_path|
  next unless image_path.match?(/\.(jpe?g)$/i)

  output_file = image_path.sub(/\.(jpe?g)$/i, '.webp')

  image = MiniMagick::Image.open(image_path)
  image.format 'webp'
  image.write output_file

  puts "Converted #{image_path} to #{output_file}"
end
