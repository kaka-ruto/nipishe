# frozen_string_literal: true

module Mutations
  UserMutation = GraphQL::ObjectType.define do
    name 'UserMutation'
    description 'Creating, Editing, Deleting, Signing in users'

    field :create_user, function: Resolvers::CreateUserResolver.new
    field :sign_in_user, function: Resolvers::SignInUserResolver.new
  end
end
