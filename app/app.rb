require 'sinatra/base'

class HeartbreakBnB < Sinatra::Base
  get '/' do
    'Hello HeartbreakBnB!'
  end

  heyyyyyyyy girl heyyyyy

  # start the server if ruby file executed directly
  run! if app_file == $0
end
