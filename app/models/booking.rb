require 'data_mapper'
require 'dm-postgres-adapter'

class Booking

  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean
  property :date, Text

  belongs_to :user
  belongs_to :listing

  def self.new_booking(user_id, listing_id, date)
    self.create(user_id: user_id,
                   listing_id: listing_id,
                   confirmed: false, date: date)
  end
end


# booking.create(user sessions[user.id],listing params[listing_id])
