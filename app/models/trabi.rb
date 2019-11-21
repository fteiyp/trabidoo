class Trabi < ApplicationRecord
  include PgSearch::Model
  # below will accept different search-keys
  pg_search_scope :search_by_address_title_year_and_color,
    against: [:address, :title, :year, :color],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  # below will only allow search by adress
  pg_search_scope :search_by_address,
    against: [:address],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  # multisearch
  multisearchable against: [:address, :title, :year, :color]

  belongs_to :user
  has_many :pictures
  has_many :bookings

  validates :title, :user_id, :color, presence: true
  validates :year, presence: true, inclusion: { in: (1957..1990).to_a }, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Nested attributes will allow us to save attributes on associated
  # records through the parent,
  # https://kolosek.com/carrierwave-upload-multiple-images/
  # accepts_nested_attributes_for :post_attachments
end
