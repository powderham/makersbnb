require 'sinatra/base'
require_relative 'data_mapper_setup'

data_mapper_configure

class HeartbreakBnB < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
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

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password])
     p @user.save
    if @user.save
      session[:user_id] = @user.id
      # p @current_user
      redirect('/users')
    else
      redirect('/')
    end

  end

  get '/users' do
    erb :"users/index"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
