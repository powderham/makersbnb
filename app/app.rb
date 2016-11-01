require 'sinatra/base'
require_relative 'data_mapper_setup'

class HeartbreakBnB < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/listings/new' do
    erb :"listings/new"
  end

  post '/listings/new' do
    Listing.create(name: params[:name], description: params[:description], price: params[:price])
    redirect('/listings')
  end

  get '/listings' do
    @listings = Listing.all()
    erb :listings
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
