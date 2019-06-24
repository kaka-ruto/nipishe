# frozen_string_literal: true

# Defines the root types (query, mutation ans subscription), the entry points to the system
class NipisheSchema < GraphQL::Schema
  query Types::QueryTypes
  mutation Types::MutationTypes
end
