# frozen_string_literal: true

class Faculty < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :school
end
