# frozen_string_literal: true

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


class Faculty < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :school
end
