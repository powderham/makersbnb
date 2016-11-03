require "rest-client"
require 'listing'
require 'user'
require 'booking'
class Email

def send_email_conf(name, email)
  RestClient.post "https://api:key-9dc9d802bf80860abf684cc4b91950bc"\
  "@api.mailgun.net/v3/sandboxba5a664ec1d4430eab16fa504983b5f4.mailgun.org/messages",
  :from => "Mailgun Sandbox <postmaster@sandboxba5a664ec1d4430eab16fa504983b5f4.mailgun.org>",
  :to => email,
  :subject => "Hello #{name}",
  :text => "Congratulations Haversham, your booking request was successful! just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
end

def get_email_details(user_id)
    @name =
    @email
    @booking_id
end

end
