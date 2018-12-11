# frozen_string_literal: true

module Types
  module Mutation
    class UserMutations < Types::BaseObject
      field :register_user, mutation: Mutations::Users::RegisterUser
      field :login_user, mutation: Mutations::Users::LoginUser
    end
  end
end
