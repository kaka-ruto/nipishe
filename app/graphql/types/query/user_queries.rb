# frozen_string_literal: true

module Types
  module Query
    class UserQueries < Types::BaseObject
      # I would be good to do as below
      field :user_profile, resolver: Queries::Users::GetUserProfile

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
