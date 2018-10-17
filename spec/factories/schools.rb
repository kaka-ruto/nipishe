# == Schema Information
#
# Table name: schools
#
#  id               :bigint(8)        not null, primary key
#  name             :string
#  type_of_school   :string
#  year_of_founding :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :school do
    name { Faker::University.name }
    type_of_school { Faker::VentureBros.vehicle }
    year_of_founding { Faker::Date.between(50.years.ago, Date.today) }
  end
end
