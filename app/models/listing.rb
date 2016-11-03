require 'data_mapper'
require 'dm-postgres-adapter'

class Listing

  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :description, Text
  property :price, Numeric
  property :date, Text

  belongs_to :user
  has n, :booking
  has n, :days, through: Resource

end
