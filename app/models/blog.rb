class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: { in: 1..140 }

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  mount_uploader :blog_image, ImageUploader

  has_many :comments, dependent: :destroy
end
