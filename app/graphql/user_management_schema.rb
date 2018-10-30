class UserManagementSchema < GraphQL::Schema
  mutation(Types::Mutation::Schools) # Get all class names in the namespace - Types::Mutation
  query(Types::QueryType) # Foo.constants

  use GraphQL::Guard.new
end
