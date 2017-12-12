class Destination < ActiveRecord::Base
  has_many :reviews_ratings

  validates :city, :presence => true

  def self.search(x)
    where("city ILIKE ? OR country ILIKE ?", "%#{x}%", "%#{x}%")
  end

  # scope :search, ->(country) {(
  # where("country ilike ?", country )
  # )}
end
