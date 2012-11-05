#encoding utf-8

require "sinatra/reloader" if development?

class Conditnio::App < Sinatra::Base

  helpers do
  end

  configure do
  end

  configure :development do
  end

end
