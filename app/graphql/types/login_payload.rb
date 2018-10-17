# frozen_string_literal: true

module Types
  LoginPayload = GraphQL::ObjectType.define do
    name 'LoginPayload'
    description 'Returns token and user after successful authentication'

    field :tokens, !types.String
    field :user, Types::UserType
  end
end
