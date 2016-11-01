require 'data_mapper'
require "dm-postgres-adapter"

require_relative 'models/listing'
require_relative 'models/user'

def data_mapper_configure
  DataMapper::Logger.new(STDOUT, :debug)
  DataMapper.setup(:default, "postgres://localhost/heartbreakbnb_test")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
