#!/usr/bin/ruby

cwd = File.basename( Dir.getwd )

if ['app', 'bin', 'config', 'db', 'doc', 'lib', 'log', 'config', 'public', 'script', 'spec', 'views'].include?( cwd )
  Dir.chdir( '..' )
elsif ['images', 'stylesheets', 'javascripts', 'models', 'views', 'controllers'].include?( cwd )
  Dir.chdir( '../..' )
end

if File.exists? "config/Capfile"
  `/opt/local/bin/cap -f config/Capfile #{ARGV.join(' ')}`
elsif File.exists? "Capfile"
  `/opt/local/bin/cap #{ARGV.join(' ')}`
else
  puts "No Capfile found; are you sure you're in an app?"
end
