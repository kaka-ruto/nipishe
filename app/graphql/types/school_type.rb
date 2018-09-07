# frozen_string_literal: true

module Types
  SchoolType = GraphQL::ObjectType.define do
    name 'SchoolType'
    description 'Type definition for schools'

    field :id, !types.ID
    field :name, !types.String
    field :type_of_school, types.String
    field :year_of_founding, types.String

    field :faculties do
      type types[Types::FacultyType]
      description 'Get all faculties belonging to this school'

      resolve ->(school, _args, _ctx) { school.faculties }
    end
  end
end
