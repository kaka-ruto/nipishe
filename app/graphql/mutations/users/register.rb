# frozen_string_literal: true

module Mutations
  module Users
    # This class initiates the user signup process
    class Register < Mutations::BaseMutation
      argument :params, Types::Inputs::Users::Registration, required: true

      field :user, Types::Objects::Users::User, null: true
      field :errors, [String], null: false

      def resolve(params:)
        register_user(params)
      rescue Interactor::Failure => e
        OpenStruct.new(
          user: nil,
          message: 'Sign Up Unsuccessful',
          errors: [e.context.error]
        )
      end

      private

      def register_user(params)
        # Namespace to 'Interactors::Users::Register.call!'' for better readability
        user_object = ::Users::Register.call!(attributes: params)

        OpenStruct.new(
          user: user_object[:user],
          auth_token: user_object[:auth_token],
          message: 'Successful Sign Up',
          errors: []
        )
      end
    end
  end
end
