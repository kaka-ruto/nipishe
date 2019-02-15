# frozen_string_literal: true

# Defines the root types (query, mutation ans subscription), the entry points to the system
class SokoplaceSchema < GraphQL::Schema
  query Types::Queries::Users
  mutation Types::Mutations::Users
end
