require 'bundler'

Bundler.require

require './conditnio_app.rb'

map '/' do
  run Conditnio::App
end
