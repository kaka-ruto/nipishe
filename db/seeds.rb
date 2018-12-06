# frozen_string_literal: true

require 'faker'

# Generate 20 schools
# 20.times do
#   School.create(
#     name: Faker::University.name,
#     type_of_school: Faker::VentureBros.vehicle,
#     year_of_founding: Faker::Date.between(50.years.ago, Date.today)
#   )
# end
# 
# # Add 5 faculties to each school
# School.all.each do |school|
#   5.times do
#     school.faculties.create(
#       name: Faker::Appliance.brand,
#       date_of_opening: Faker::Date.between(50.years.ago, Date.today)
#     )
#   end
# end
