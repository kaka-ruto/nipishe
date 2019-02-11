# frozen_string_literal: true

module Mutations
  module Users
    # This class initiates the user login process
    class Login < Mutations::BaseMutation
      argument :attributes, Types::Inputs::Users::Login, required: true

      field :user, Types::Objects::Users::User, null: true
      field :errors, [String], null: false

      def resolve(attributes:)
        user_object = ::Users::Login.call!(attributes: attributes)

        OpenStruct.new(
          user: user_object[:user],
          auth_token: user_object[:auth_token],
          message: 'Successful Login',
          errors: []
        )
      rescue Interactor::Failure => e
        OpenStruct.new(
          user: nil,
          message: 'Login Unsuccessful',
          errors: e.context.error
        )
      end
    end
  end
end
