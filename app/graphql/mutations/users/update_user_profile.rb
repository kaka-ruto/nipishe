# frozen_string_literal: true

module Mutations
  module Users
    # Class that update's a user's profile info
    class UpdateUserProfile < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :attributes, Types::Inputs::Users::ProfileUpdate, required: true

      field :user, Types::Objects::Users::UserObject, null: true
      field :errors, [String], null: false

      def resolve(id:, attributes:)
        if context[:current_user].id == id
          update_user = ::Users::UpdateUserProfile.call!(
            user: context[:current_user], attributes: attributes
          )

          OpenStruct.new(
            user: update_user.user,
            message: 'Profile Successfuly Updated',
            errors: []
          )
        else
          {
            errors: ['Authentication required']
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
