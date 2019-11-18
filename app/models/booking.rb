class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trabi

  validates :user_id, :trabi_id, :start_date, :end_date, presence: true
  validates :rating_review, inclusion: { in: (0..5).to_a }, numericality: { only_integer: true }
end
