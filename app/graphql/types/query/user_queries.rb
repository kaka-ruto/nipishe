# frozen_string_literal: true

module Types
  module Query
    class UserQueries < Types::BaseObject
      field :user_profile, resolver: Queries::Users::UserProfile
    end
  end
end
