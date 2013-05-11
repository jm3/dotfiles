#!/usr/bin/env ruby
# encoding: UTF-8

require "haml"
require "omniauth"
require "omniauth-dropbox"
require "omniauth-github"
require "omniauth-twitter"
require "rubygems"
require "sinatra"

use Rack::Session::Cookie

use OmniAuth::Builder do
  # all providers use: /auth/:providername
  # all are invoked with callback: auth/:pname/callback?etc
  provider :developer
  provider :github,     ENV['GH_KEY'], ENV['GH_SECRET'], scope: "gist"
  provider :dropbox,    ENV['DB_KEY'], ENV['DB_SECRET']
  provider :twitter,    ENV["TW_KEY"], ENV["TW_SECRET"]
end

get "/" do
  <<-HTML
  <br><br><br><br><br>
  <center>
  Sign in with:
  <a href='/auth/dropbox'>Dropbox</a>
  <a href='/auth/github'>Github</a>
  <a href='/auth/twitter'>Twitter</a>
  HTML
end

get "/auth/:name/callback" do
  auth = request.env["omniauth.auth"]

  puts auth[:provider]

  if auth[:provider] == "twitter"
    puts auth[:info][:nickname]
    puts y auth

  elsif auth[:provider] == "dropbox"
    puts auth[:info][:uid]
    puts auth[:info][:name]
    puts auth[:info][:email]
    puts auth[:credentials][:token]
    puts auth[:credentials][:secret]

  elsif auth[:provider] == "github"
    puts auth[:uid]
    puts auth[:info][:nickname]
    puts auth[:info][:name]
    puts auth[:info][:email]
    puts auth[:credentials][:token]
  end

  haml :in
end
