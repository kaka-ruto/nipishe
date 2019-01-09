# frozen_string_literal: true

module Queries
  module Users
    # Class that gets one user's profile info
    class GetUserProfile < Queries::Base
      argument :id, ID, required: true

      type Types::Objects::Users::UserProfile, null: false
      # type [String], null: false # Find a way to return errors also

      def resolve(id:)
        # binding.pry
        # if context[:current_user]
        user = ::Users::GetUserProfile.call!(id: id).user

        user

      rescue Interactor::Failure => e
        # This does not work since we are not returning any Type error, we're only returning a user
        OpenStruct.new(
          user: nil,
          message: 'User Not Found',
          errors: e.context.error
        )
      end
    end
  end
end
