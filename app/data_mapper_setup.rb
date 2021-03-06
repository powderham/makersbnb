require 'data_mapper'
require "dm-postgres-adapter"

require_relative 'models/user'
require_relative 'models/day'
require_relative 'models/booking'
require_relative 'models/email'
require_relative 'models/listing'


def data_mapper_configure
  DataMapper::Logger.new(STDOUT, :debug)
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/heartbreakbnb_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
