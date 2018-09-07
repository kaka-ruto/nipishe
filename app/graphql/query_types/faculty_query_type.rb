# frozen_string_literal: true

module QueryTypes
  FacultyQueryType = GraphQL::ObjectType.define do
    name 'Faculty'
    description 'Query types for faculties'

    field :faculties do
      type types[Types::FacultyType]
      description 'Get all faculties'

      resolve ->(_obj, _args, _ctx) { Faculty.all }
    end

    field :faculty do
      type Types::FacultyType
      description 'Get one faculty'
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) { Faculty.find(args[:id]) }
    end
  end
end
