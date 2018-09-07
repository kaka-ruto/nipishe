# frozen_string_literal: true

module Types
  FacultyType = GraphQL::ObjectType.define do
    name 'FacultyType'
    description 'Type definition for faculties'

    field :id, !types.ID
    field :name, !types.String
    field :date_of_opening, types.String
  end
end
