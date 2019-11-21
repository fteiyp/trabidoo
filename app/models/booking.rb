class Booking < ApplicationRecord
  # multisearch
  include PgSearch::Model
  multisearchable against: [:start_date, :end_date]

  belongs_to :user
  belongs_to :trabi

  validates :user_id, :trabi_id, :start_date, :end_date, presence: true
  validates :rating_review, inclusion: { in: [nil, 0, 1, 2, 3, 4, 5] }
end
