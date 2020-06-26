class Post < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :likes
  has_many :comments
  
  validates :content, presence: true
end
