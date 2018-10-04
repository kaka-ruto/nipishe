# frozen_string_literal: true

module Types
  AuthType = GraphQL::ObjectType.define do
    name 'AuthType'
    description 'Returns token after successful authentication'

    field :api_token, !types.String
  end
end
