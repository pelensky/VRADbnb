require 'bcrypt'

class Owner
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text
  property :password_confirmation, Text

  has n, :listings


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    owner = Owner.first(email: email)
    if owner && BCrypt::Password.new(owner.password_digest) == password
      owner
    else
      nil
    end
  end
end
