class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PictureUploader

  has_many :bookings
  has_many :trabis

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
