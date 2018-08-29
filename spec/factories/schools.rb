FactoryBot.define do
  factory :school do
    name { Faker::University.name }
    type_of_school { Faker::VentureBros.vehicle }
    year_of_founding { Faker::Date.between(50.years.ago, Date.today) }
  end
end
