# load libs:
require 'rubygems'
require 'pp'

print "ruby version: ", `/usr/bin/env ruby --version`

@o = Object.methods

# mess the default return val which can be annoying
# conf.return_format = ""
# conf.return_format = "=> %s\n"

# limit to eg 512 chars:
# conf.return_format = "=> limited output\n %.512s\n"

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

