# frozen_string_literal: true

# Defines the root types (query, mutation ans subscription), the entry points to the system
class UserManagementSchema < GraphQL::Schema
  query Types::Queries::Users
  mutation Types::Mutations::Users
end
