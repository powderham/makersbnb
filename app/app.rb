ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

data_mapper_configure

class HeartbreakBnB < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      User.get(session[:user_id])
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/listings/new' do
    erb :"listings/new"
  end

  post '/listings/new' do

    Listing.create(name: params[:name],
                   description: params[:description],
                   price: params[:price],
                   user_id: session[:user_id],
                   date: params[:date])
    redirect('/listings')
  end

  get '/listings' do
    @listings = Listing.all()
    erb :listings
  end

  get '/listings/search' do
      @date = params[:date]
      @listings = Listing.all()
      erb :"/listings/search"
    end

  post '/bookings/new' do
    listing = Listing.get(params[:listing_id])
    Booking.create(user_id: session[:user_id],
                   listing_id: listing.id)

    redirect("bookings/new")
  end

  get '/bookings/new' do
    erb :"bookings/new"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    @user = User.new(first_name: params[:first_name],
                 last_name: params[:last_name],
                 username: params[:username],
                 email: params[:email],
                 password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect('/users')
    else
      redirect('/')
    end

  end

  get '/users' do
    @user = session[:user_id]
    # @listings = Listing.all()
    # p listings
    erb :"users/index"
  end

  delete '/users' do
    session.clear
    redirect('/listings')
  end

  get '/users/sign_in' do
    erb :"users/sign_in"
  end

  get '/users/sign_out' do
    erb :"users/sign_out"
  end

  post "/users/sign_in" do
    @user = User.first(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users'
    else
      erb :listings
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
