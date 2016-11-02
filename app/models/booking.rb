require 'data_mapper'
require 'dm-postgres-adapter'

class Booking

  include DataMapper::Resource

  property :id, Serial

  belongs_to :user
  belongs_to :listing
  # property :listing, ? <--- does this belong to the listing itself or to the user
  # property :user, ? <--- do we put both users i.e. guests and hosts in one or seperate?
    # property :host (host user_id)
    # property :guest (guest user_id)

  # booking ref/ID could be used as a confirmation, i.e. via Twilio or MailChimp
  # utilise google maps api to show location of listing on booking



end


# booking.create(user sessions[user.id],listing params[listing_id])
