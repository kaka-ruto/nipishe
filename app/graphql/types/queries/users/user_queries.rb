# frozen_string_literal: true

module Types
  module Queries
    class Users < Types::BaseObject
      # I would be good to do as below
      field :profile, resolver: Queries::Users::GetProfile

      # OR
      # field :user_profile, Types::Objects::Users::UserProfile, null: false do
      #   argument :id, Int, required: true
      # end
      #
      # def user_profile(id:)
      #   User.find(id)
      # end
    end
  end
end
