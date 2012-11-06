#encoding utf-8

require 'uri'

require 'bundler'
Bundler.require

require 'sinatra/reloader' if development?

require "./models/sighting"

module Conditnio
  class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure :development do
      register Sinatra::Reloader
      set :database, 'sqlite:///development.db'
    end

    configure :production do
      set :database, ENV['DATABASE_URL']
    end

    get '/callback/:callback/:token' do
      sighting = Sighting.find_by_token(params[:token])

      content_type 'text/javascript', :charset => 'utf-8'
      if sighting.nil?
        Sighting.create(token: params[:token])
        "#{params[:callback]}()"
      else
        if development?
          "/* #{sighting.to_yaml} */"
        else
          ""
        end
      end
    end

  end
end
