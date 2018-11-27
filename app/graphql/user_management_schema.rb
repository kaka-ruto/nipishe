class UserManagementSchema < GraphQL::Schema
  mutation(Types::Mutation::Users) # Get all class names in the namespace - Types::Mutation
  query(Types::QueryType) # Foo.constants

  use GraphQL::Guard.new
end
