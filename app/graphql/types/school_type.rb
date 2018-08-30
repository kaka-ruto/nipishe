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
      type !types[Types::FacultyType]
      description 'Get all faculties belonging to this school'

      resolve ->(obj, _args, _ctx) { obj.faculties }
    end
  end
end
