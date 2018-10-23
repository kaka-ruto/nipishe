# frozen_string_literal: true

module QueryTypes
  SchoolQueryType = GraphQL::ObjectType.define do
    name 'SchoolQueryType'
    description 'Know all schools in the world'

    field :get_schools, function: Resolvers::Schools::GetSchools.new
    field :get_school, function: Resolvers::Schools::GetSchool.new
  end
end
