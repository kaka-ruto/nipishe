# frozen_string_literal: true

module Mutations
  module Users
    class LoginUser < Mutations::BaseMutation
      argument :attributes, Types::Inputs::Users::UserLoginInput, required: true

      field :user, Types::Objects::Users::UserObject, null: true
      field :errors, [String], null: false

      def resolve(attributes:)
        binding.pry
        user = User.find_for_database_authentication(email: attributes[:email])
        # Try User.find_by!
        user ||= User.new

        if user.valid_password?(attributes[:password])
          {
            user: user,
            message: 'Successful Login',
            errors: []
          }
        else
          errors = user.errors.full_messages

          {
            user: user,
            message: 'Login Unsuccessful',
            errors: errors
          }
        end
      end
    end
  end
end
