class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :trabi

  validates :url, :trabi_id, presence: true
end
