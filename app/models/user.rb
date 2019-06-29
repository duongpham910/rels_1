class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_attached_file :avatar

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates_attachment :avatar,
    content_type: { content_type: /\Aimage\/.*\z/ },
    size: { in: 0..100.kilobytes }

  has_secure_password
end
