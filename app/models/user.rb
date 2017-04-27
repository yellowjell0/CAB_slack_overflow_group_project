class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
<<<<<<< HEAD
  has_many :comments
=======
  has_many :comments, as: :commentable


  def reputation
    answers.map(&:votes).count + questions.map(&:votes).count + comments.map(&:votes).count
  end
>>>>>>> user_profile

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = self.find_by(email: email)
    if user != nil
      user.password == password
    end
  end

end
