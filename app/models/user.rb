class User < ActiveRecord::Base
  attr_accessible :password_digest, :token, :username
  attr_reader :password

  before_validation :reset_token

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, allow_nil: true }

  has_many(
    :subs,
    class_name: "Sub",
    foreign_key: :moderator_id,
    primary_key: :id
  )


  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def reset_token
    self.token = SecureRandom.urlsafe_base64(16)
  end

  def reset_token!
    self.token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.token
  end
end
