class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes, dependent: :destroy

  validates :content, presence: true

end
