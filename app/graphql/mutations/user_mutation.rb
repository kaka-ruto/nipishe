# frozen_string_literal: true

module Mutations
  UserMutation = GraphQL::ObjectType.define do
    name 'UserMutation'
    description 'Creating, Editing, Deleting, Signing in users'

    field :register_user, function: Resolvers::Users::Register.new
    field :login_user, function: Resolvers::Users::Login.new
  end
end
