# frozen_string_literal: true

module Queries
  module Users
    # Class that gets one user's profile info
    class GetProfile < Queries::Base
      argument :id, ID, required: true

      type Types::Objects::Users::Profile, null: false
      # type [String], null: false # Find a way to return errors also

      def resolve(id:)
        return context[:current_user] if logged_in_user?(id)

        raise GraphQL::ExecutionError, 'You are not allowed'
      end

      private

      def logged_in_user?(id)
        context[:current_user].id == id
      end
    end
  end
end
