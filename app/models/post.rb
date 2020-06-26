class Post < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :likes
  
  validates :content, presence: true
end
