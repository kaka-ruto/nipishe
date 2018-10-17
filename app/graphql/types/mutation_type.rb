# frozen_string_literal: true

module Types
  MutationType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = 'Mutation'
    root_type.description = 'The root of our mutations'
    root_type.interfaces = []
    root_type.fields = Util::FieldCombiner.combine(
      [
        Mutations::UserMutation,
        Mutations::SchoolMutation,
        Mutations::FacultyMutation
      ]
    )
  end
end
