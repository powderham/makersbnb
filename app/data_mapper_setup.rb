require 'data_mapper'
require "dm-postgres-adapter"

require_relative 'models/listing'

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "postgres://localhost/heartbreakbnb_test")
DataMapper.finalize
DataMapper.auto_migrate!
