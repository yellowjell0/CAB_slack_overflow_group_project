class User < ActiveRecord::Base
  include BCrypt
  has_many :questions
  has_many :answers
  has_many :comments, as: :commentables

  def password
    @password ||= Bcrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Bcrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email)
    user = self.find_by(email: email)
    if user != nil
      user.password == password
    end
  end
end
