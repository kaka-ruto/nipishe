# frozen_string_literal: true

module Queries
  module Users
    # Class that gets one user's profile info
    class GetProfile < Queries::Base
      argument :id, ID, required: true

      type Types::Objects::Users::Profile, null: false
      # type [String], null: false # Find a way to return errors also

      def resolve(id:)
        if context[:current_user].id == id
          context[:current_user]
        else
          raise GraphQL::ExecutionError, 'You are not allowed'
        end
      rescue Interactor::Failure => e
        OpenStruct.new(
          user: nil,
          message: 'User Not Found',
          errors: e.context.error
        )
      end
    end
  end
end
