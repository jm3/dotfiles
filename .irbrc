# load libs:
require 'rubygems'

print "ruby version: ", `/usr/bin/env ruby --version`

# begin
#   Gem::Specification::find_by_name "wirble"
#   gem "wirble"
#   require 'wirble' # start wirble (with color)
#   Wirble.init
#   Wirble.colorize
# rescue
# end

# Easily print methods local to an object's class
# same as .instance_methods(false)
class Object
  def local_methods
    (instance_methods - Object.instance_methods).sort
  end
end

