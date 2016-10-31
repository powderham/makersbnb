require 'sinatra/base'
require_relative 'data_mapper_setup'

class HeartbreakBnB < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/listings' do
    @listing1 = Listing.create(name:params[:name], description:params[:description], price:params[:price])
    erb :listings
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
