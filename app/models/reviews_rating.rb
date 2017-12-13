class ReviewsRating < ApplicationRecord
  include Search
  belongs_to :destination
  validates :rating, :presence => true
  validates :review, :presence => true
  validates :destination_id, :presence => true

end
