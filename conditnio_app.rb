#encoding utf-8

require 'bundler'
Bundler.require

require 'uri'

require 'sinatra/reloader' if development?

module Conditnio
  class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    helpers do
    end

    configure do
    end

    configure :development do
      set :database, 'sqlite:///development.db'
      puts "database connection established"
    end

    configure :production do
      # Database connection
      db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/conditnio')
      ActiveRecord::Base.establish_connection(
        :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
        :host     => db.host,
        :port     => db.port,
        :username => db.user,
        :password => db.password,
        :database => db.path[1..-1],
        :encoding => 'utf8'
      )
    end

  end
end
