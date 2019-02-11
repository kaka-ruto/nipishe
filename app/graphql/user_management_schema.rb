class UserManagementSchema < GraphQL::Schema
  mutation(Types::Mutations::Users) # Get all class names in the namespace - Types::Mutation
  query(Types::Queries::Users) # Foo.constants
end
