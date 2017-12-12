FactoryBot.define do
  factory(:destination) do
    city(Faker::TwinPeaks.location)
    country(Faker::StarTrek.location)
  end
end
