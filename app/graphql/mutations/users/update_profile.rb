# frozen_string_literal: true

module Mutations
  module Users
    # Class that update's a user's profile info
    class UpdateProfile < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :attributes, Types::Inputs::Users::ProfileUpdate, required: true

      field :user, Types::Objects::Users::User, null: true
      field :errors, [String], null: false

      def resolve(id:, attributes:)
        if context[:current_user].id == id
          update_profile(attributes)
        else
          { errors: ['Authentication required'] }
        end
      rescue Interactor::Failure => e
        # This does not work since we are not returning any Type error, we're only returning a user
        failed_context(e)
      end

      private

      def update_profile(attributes)
        user = ::Users::UpdateProfile.call!(
          user: context[:current_user], attributes: attributes
        ).user

        OpenStruct.new(
          user: user,
          message: 'Profile Successfuly Updated',
          errors: []
        )
      end

      def failed_context(e)
        OpenStruct.new(
          user: nil,
          message: 'User Update Not Successful',
          errors: [e.context.error]
        )
      end
    end
  end
end
