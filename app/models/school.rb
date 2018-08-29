# frozen_string_literal: true

class School < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :faculties, dependent: :destroy
end
