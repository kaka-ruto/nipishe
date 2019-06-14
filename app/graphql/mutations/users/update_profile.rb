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
        user = User.find(id)

        # authorize! user, to: :update?, with: ::Users::UserPolicy
        if allowed_to? :update?, user, with: ::Users::UserPolicy
          update_profile(user, attributes)
        else
          failed_authorization
        end
      end

      private

      def update_profile(user, attributes)
        user = ::Users::UpdateProfile.call(
          user: user, attributes: attributes
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

      def failed_authorization
        raise GraphQL::ExecutionError, 'You are not allowed to update this user'
      end
    end
  end
end
