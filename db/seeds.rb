user = User.create(email: 'user@example.com', nickname: 'UOne', name: 'User One', password: "monkey67")
puts "My user email is #{user.email}"

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_destinations
    seed.generate_reviews_ratings
  end

  def generate_destinations
    20.times do |i|
      destination = Destination.create!(
        city: Faker::TwinPeaks.location,
        country: Faker::StarTrek.location
      )
      puts "Destination #{i}: City is #{destination.city} and country is '#{destination.country}'."
    end
  end

  def generate_reviews_ratings
    20.times do |k|
      reviews = ReviewsRating.create!(
        review: Faker::Lovecraft.paragraph,
        rating: Faker::Number.between(1, 5),
        destination_id: Faker::Number.between(1, 20)
      )
      puts "Destination #{k}: City is rated #{reviews.rating}. Rick Steves calls it '#{reviews.review}'. And it's ID is '#{reviews.destination_id}'."
    end
  end
end

Seed.begin# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
