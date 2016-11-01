require 'data_mapper'
require "dm-postgres-adapter"

require_relative 'models/listing'
require_relative 'models/user'

<<<<<<< HEAD
def data_mapper_configure
  DataMapper::Logger.new(STDOUT, :debug)
  DataMapper.setup(:default, "postgres://localhost/heartbreakbnb_test")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
=======
DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "postgres://localhost/heartbreakbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
>>>>>>> 758cee9c1d6531c9b81e39db89a629f90e91502e
