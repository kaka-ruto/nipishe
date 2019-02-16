# frozen_string_literal: true

module Mutations
  module Users
    # This class initiates the user login process
    class Login < Mutations::BaseMutation
      argument :attributes, Types::Inputs::Users::Login, required: true

      field :user, Types::Objects::Users::User, null: true
      field :errors, [String], null: false

      def resolve(attributes:)
        login_user(attributes)
      rescue Interactor::Failure => e
        failed_login(e)
      end

      private

      def login_user(attributes)
        user_object = ::Users::Login.call!(attributes: attributes)

        OpenStruct.new(
          user: user_object[:user],
          auth_token: user_object[:auth_token],
          message: 'Successful Login',
          errors: []
        )
      end

      def failed_login(e)
        OpenStruct.new(
          user: nil,
          message: 'Login Unsuccessful',
          errors: e.context.error
        )
      end
    end
  end
end
