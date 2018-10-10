# frozen_string_literal: true

module Resolvers
  module Users
    class Login < GraphQL::Function
      argument :login_data, !Types::Inputs::Users::Login

      type Types::AuthType

      def call(_obj, args, _ctx)
        resource = User.find_for_database_authentication(email: args[:login_data][:email])
        resource ||= User.new

        if resource.valid_password?(args[:login_data][:password])
          auth_token = resource.generate_auth_token
          successful_login(auth_token)
        else
          invalid_login_attempt
        end
      end

      private

      def successful_login(auth_token)
        OpenStruct.new(
          auth_token: auth_token,
          message: 'Successful Sign In'
        ) # status: 302 temporary redirection to /secured
      end

      def invalid_login_attempt
        OpenStruct.new(
          message: 'Your password or email seems incorrect',
          status: 401
        )
      end
    end
  end
end
