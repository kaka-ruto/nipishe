# frozen_string_literal: true

module Types
  module Objects
    module Schools
      class SchoolObject < Types::BaseObject
        description 'How one school looks like when returned'

        field :id, ID, null: false
        field :name, String, null: false
        field :type_of_school, String, null: true
        field :year_of_founding, String, null: true

        field :faculties, [Types::FacultyType], 'Faculties found in this school', null: true
      end
    end
  end
end
