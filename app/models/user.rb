require "data_mapper"
require "bcrypt"
require 'dm-postgres-adapter'


class User

    include DataMapper::Resource

    property :id, Serial
    property :email, String
    property :password_digest, Text
    property :password_confirmation, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

end

DataMapper.setup(:default, "postgres://localhost/vradbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
