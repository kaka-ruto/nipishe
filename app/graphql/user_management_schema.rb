class UserManagementSchema < GraphQL::Schema
  mutation(Types::Mutation::UserMutations) # Get all class names in the namespace - Types::Mutation
  query(Types::Query::UserQueries) # Foo.constants
end
