FactoryBot.define do
  factory :faculty do
    name { Faker::Appliance.brand  }
    date_of_opening { Faker::Date.between(50.years.ago, Date.today) }
    association :school, factory: :school, strategy: :build
  end
end
