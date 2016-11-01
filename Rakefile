
require 'data_mapper'
require 'dm-postgres-adapter'
# require_relative 'app/app'

# RSpec::Core::RakeTask.new :spec

# task default: [:spec]

namespace :db do
 task :auto_upgrade do
   puts "Upgrading database"
   DataMapper.auto_upgrade!
 end

 task :auto_migrate do
   puts "Migrating database"
   DataMapper.auto_migrate!
 end
end
