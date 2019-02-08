# frozen_string_literal: true

module Types
  module Mutation
    class UserMutations < Types::BaseObject
      field :register_user, mutation: Mutations::Users::RegisterUser
      field :login_user, mutation: Mutations::Users::LoginUser
      field :update_user_profile, mutation: Mutations::Users::UpdateUserProfile
    end
  end
end
