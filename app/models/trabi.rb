class Trabi < ApplicationRecord
  belongs_to :user
  has_many :pictures
  # Nested attributes will allow us to save attributes on associated
  # records through the parent,
  # https://kolosek.com/carrierwave-upload-multiple-images/
  accepts_nested_attributes_for :post_attachments
end
