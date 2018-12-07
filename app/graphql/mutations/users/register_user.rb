# frozen_string_literal: true

module Mutations
  module Users
    # This class initiates the user signup process
    class RegisterUser < Mutations::BaseMutation
      argument :attributes, Types::Inputs::Users::UserRegistrationInput, required: true

      field :user, Types::Objects::Users::UserObject, null: true
      field :errors, [String], null: false

      def resolve(attributes:)
        user_object = Auth::RegisterUser.call!(attributes: attributes)

        OpenStruct.new(
          user: user_object[:user],
          auth_token: user_object[:auth_token],
          message: 'Successful Sign Up',
          errors: []
        )
      rescue Interactor::Failure => e
        OpenStruct.new(
          user: nil,
          message: 'Sign Up Unsuccessful',
          errors: e.context.error
        )
      end
    end
  end
end
