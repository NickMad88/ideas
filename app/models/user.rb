class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea, dependent: :destroy


  EMAIL_REGEX = /\A[A-Za-z0-9\.]+@[A-Za-z]+\.[A-Za-z]{3}/
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end
end
