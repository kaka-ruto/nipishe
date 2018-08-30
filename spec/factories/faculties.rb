FactoryBot.define do
  factory :faculty do
    name { Faker::Artist.name }
    date_of_opening { Faker::Date.between(50.years.ago, Date.today) }
    association :school, factory: :school, strategy: :build
  end
end
