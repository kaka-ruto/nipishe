# frozen_string_literal: true

module Mutations
  module Users
    # This class initiates the user login process
    class LoginUser < Mutations::BaseMutation
      argument :attributes, Types::Inputs::Users::UserLoginInput, required: true

      field :user, Types::Objects::Users::UserObject, null: true
      field :errors, [String], null: false

      def resolve(attributes:)
        binding.pry
        user_object = Auth::LoginUser.call!(attributes: attributes)

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
