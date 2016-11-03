require "rest-client"
require_relative './listing'
require_relative './user'
require_relative './booking'
class Email

def confirmation_email(name, email, reference)
  RestClient.post "https://api:key-9dc9d802bf80860abf684cc4b91950bc"\
  "@api.mailgun.net/v3/sandboxba5a664ec1d4430eab16fa504983b5f4.mailgun.org/messages",
  :from => "Mailgun Sandbox <postmaster@sandboxba5a664ec1d4430eab16fa504983b5f4.mailgun.org>",
  :to => "#{name} <#{email}>",
  :subject => "Hello #{name}",
  :text => "Congratulations #{name}, your booking request was successful! \n
            Your booking reference is #{reference}. Enjoy your stay, from HeartbreakBnB"
end

def send_email(booking_id)
    p booking = Booking.get(booking_id)
    user = User.get(booking.user_id)
    p @name = user.first_name
    p @email = user.email
    p @booking_id = booking_id
    confirmation_email(@name, @email, @booking_id)
end


end
