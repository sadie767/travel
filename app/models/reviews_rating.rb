class ReviewsRating < ApplicationRecord
  belongs_to :destination
  validates :rating, :presence => true
  validates :review, :presence => true
  validates :destination_id, :presence => true

end
