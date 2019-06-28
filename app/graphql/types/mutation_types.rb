# frozen_string_literal: true

module Types
  class MutationTypes < BaseObject
    field :register, mutation: ::Mutations::Users::Register
    field :login, mutation: ::Mutations::Users::Login
    field :update_profile, mutation: ::Mutations::Users::UpdateProfile
    field :logout, mutation: ::Mutations::Users::Logout
  end
end
