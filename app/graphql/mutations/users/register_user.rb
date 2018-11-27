# frozen_string_literal: true

module Mutations
  module Users
    class RegisterUser < Mutations::BaseMutation
      argument :attributes, Types::Inputs::Users::UserRegistrationInput, required: true

      field :user, Types::Objects::Users::UserObject, null: true
      field :errors, [String], null: false

      def resolve(attributes:)
        user = User.create(attributes.to_h)

        if user.save
          auth_token = user.generate_auth_token

          {
            user: user,
            message: 'Successful Sign Up',
            errors: []
          }
        else
          errors = user.errors.full_messages

          {
            user: user,
            message: 'Sign Up Unsuccessful',
            errors: errors
          }
        end
      end
    end
  end
end
