ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/email'
require_relative 'models/data_getter'

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

  post "/listings/add_availability" do
    listing = Listing.get(params[:listing_id])
    listing.days << Day.first_or_create(date: DateTime.parse(params[:available_date]))
    listing.save
    redirect "/users"
  end

  post '/listings/new' do
    listing = Listing.create(name: params[:name],
                   description: params[:description],
                   price: params[:price],
                   user_id: session[:user_id])
    listing.days << Day.first_or_create(date: DateTime.parse(params[:available_date]))
    listing.save
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
    listing = Listing.get(params[:Request_Booking])
    Booking.new_booking(session[:user_id], listing.id, params[:date])
    erb :index
    redirect("bookings/new")
  end

  get '/bookings/new' do
    @booked = Booking.last
    @listings = Listing.all
    @listing = Listing.get(@booked.listing_id)
    @host = User.get(@listing.user_id)
    p @host
    @user = User.all
    erb :"bookings/new"
  end

  post '/bookings/confirm' do
        booking = Booking.get(params[:confirm_booking])
        booking.update(:confirmed => true)
        email = Email.new
        email.send_email(params[:confirm_booking])
        redirect ("/users")
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
    if @user
      @listings = Listing.all(user_id: @user)
      getter = Data_getter.new
      @parcel_arr = getter.return_listings(@listings)
      erb :"users/index"
    else
      erb :"users/sign_in"
    end
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
