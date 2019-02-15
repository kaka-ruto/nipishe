class SokoplaceSchema < GraphQL::Schema
  # Find a way to load all class names within namespaces eg Types::Mutation
  mutation Types::Mutations::Users::UserMutations
  query Types::Queries::Users::UserQueries
end
