class Picture < ApplicationRecord
  mount_uploader :url, PictureUploader
  belongs_to :trabi

  validates :url, :trabi_id, presence: true
end
