# == Schema Information
#
# Table name: faculties
#
#  id              :bigint(8)        not null, primary key
#  date_of_opening :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  school_id       :bigint(8)
#
# Indexes
#
#  index_faculties_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#

FactoryBot.define do
  factory :faculty do
    name { Faker::Artist.name }
    date_of_opening { Faker::Date.between(50.years.ago, Date.today) }
    association :school, factory: :school, strategy: :build
  end
end
