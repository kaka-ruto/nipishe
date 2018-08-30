# frozen_string_literal: true

module Types
  QueryType = GraphQL::ObjectType.define do  # was class QueryType < Types::BaseObject
    name 'Queries'
    description 'The query root of this schema'

    # Schools #
    field :schools do
      type !types[Types::SchoolType]
      description 'Get all schools'

      resolve ->(_obj, _args, _ctx) { School.all }
    end

    field :school do
      type !types[Types::SchoolType]
      description 'Get one school'
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) { School.find_by!(id: args[:id]) }
    end

    # Faculties #
    field :faculties do
      type !types[Types::FacultyType]
      description 'Get all faculties'

      resolve ->(_obj, _args, _ctx) { Faculty.all }
    end

    field :faculty do
      type !types[Types::FacultyType]
      description 'Get one faculty'
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) { Faculty.find_by!(id: args[:id]) }
    end
  end
end
