# frozen_string_literal: true

module Queries
  module Users
    # Class that gets one user's profile info
    class Profile < Queries::BaseQuery
      argument :id, ID, required: true

      type Types::Objects::Users::Profile, null: false
      # type [String], null: false # Find a way to return errors also

      def resolve(id:)
        User.find(id)
      end
    end
  end
end
