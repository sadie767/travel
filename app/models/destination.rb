class Destination < ApplicationRecord
  has_many :reviews_ratings

  # validates :city, :presence => true
  # validates :country, :presence => true

  # def self.search(x)
  #   where("city ILIKE ? OR country ILIKE ?", "%#{x}%", "%#{x}%")
  # end

  scope :search, ->(x) {(
  where("city ILIKE ? OR country ILIKE ?", "%#{x}%", "%#{x}%")
  )}
end
