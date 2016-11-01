require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :first_name, Text
  property :last_name, Text
  property :username, String,
           unique: true,
           messages: {
             is_unique: "Username is already registered"
           }
  property :email, String,
           required: true,
           format: :email_address,
           unique: true,
           messages: {
             is_unique: "Email is already registered"
           }
  property :password, String


end
