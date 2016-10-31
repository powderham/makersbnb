require 'sinatra/base'
require_relative 'data_mapper_setup'

class HeartbreakBnB < Sinatra::Base
  get '/' do
    erb[:index]
  end

  get '/listings' do
    erb[:listings]
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
