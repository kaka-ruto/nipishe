# frozen_string_literal: true

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


class School < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :faculties, dependent: :destroy
end
