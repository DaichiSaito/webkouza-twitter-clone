class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :avater_image, AvatarUploader
end
