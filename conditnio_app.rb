#encoding utf-8

require 'uri'

require 'bundler'
Bundler.require

require 'sinatra/reloader' if development?

require "./models/sighting"

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

    get '/callback/:callback/:token' do
      sighting = Sighting.find_by_token(params[:token])

      if sighting.nil?
        Sighting.create(token: params[:token])
        "#{params[:callback]}()"
      else
        ""
      end
    end

  end
end
