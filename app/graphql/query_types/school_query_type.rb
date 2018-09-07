# frozen_string_literal: true

module QueryTypes
  SchoolQueryType = GraphQL::ObjectType.define do
    name 'SchoolQueryType'
    description 'Querytypes for schools'

    field :schools, types[Types::SchoolType], 'Get all schools' do
      resolve ->(_obj, _args, _ctx) { School.all }
    end

    field :school, Types::SchoolType, 'Get one school' do
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) {
        School.find(args[:id])
      }
    end
  end
end
