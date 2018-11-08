class User < ApplicationRecord
  validates :name, presence: true,length:{ maximum: 30}
  validates :email, presence: true,length:{ maximum: 255},
  format: {with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  before_validation {email.downcase!}
  validates :password, presence: true, length:{ minimum: 6}
  has_secure_password

  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog

  mount_uploader :image, ImageUploader

  has_many :active_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :passive_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

end
