require "rubygems"
require "bundler"
Bundler.setup
require "./app.rb"

run Sinatra::Application
