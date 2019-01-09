# frozen_string_literal: true

module Mutations
  module Users
    # Class that update's a user's profile info
    class UpdateUserProfile < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :attributes, ID, required: true

      field :user, Types::Objects::Users::UserObject, null: true
      field :errors, [String], null: false

      def resolve(id:, attributes:)
        # binding.pry
        if context[:current_user] # Use this instead of passing the user id
          update_user = ::Users::UpdateUserProfile.call!(id: id, attributes: attributes)

          if update_user.success?
            {
              user: update_user.user,
              errors: []
            }
          else
            {
              user: nil,
              errors: errors
            }
          end
        else
          {
            error: 'Authentication required'
          }
        end

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
