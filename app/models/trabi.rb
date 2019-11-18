class Trabi < ApplicationRecord
  belongs_to :user
  has_many :pictures
  has_many :bookings

  validates :user_id, :color, presence: true
  validates :year, presence: true, inclusion: { in: (1957..1990).to_a }, numericality: { only_integer: true }
  # Nested attributes will allow us to save attributes on associated
  # records through the parent,
  # https://kolosek.com/carrierwave-upload-multiple-images/
  # accepts_nested_attributes_for :post_attachments
end
