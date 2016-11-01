require 'data_mapper'
require "dm-postgres-adapter"

require_relative 'models/listing'

DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "postgres://localhost/heartbreakbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
