require 'data_mapper'
require 'dm-postgres-adapter'

class Day
  include DataMapper::Resource
  property :id, Serial
  property :date, DateTime
  has n, :listing, through: Resource
end
