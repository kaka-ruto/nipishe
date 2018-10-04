# frozen_string_literal: true

module Resolvers
  class SignInUserResolver < GraphQL::Function
    argument :login_data, !Types::Inputs::Users::UserLoginInputType

    type Types::AuthType

    def call(_obj, args, _ctx)
      @user = User.find_for_database_authentication(email: args[:email])

      if @user
        if @user.valid_password?(args[:password])
          OpenStruct.new(api_token: @user.api_token)
        else
          GraphQL::ExecutionError.new('Incorrect Email/Password')
        end
      else
        GraphQL::ExecutionError.new('User not registered on this application')
      end
    end

    def remove_camel_case
      Hash[args['registrationDetails'].to_h.map { |key, value| [key.to_s.underscore.to_sym, value]}]
    end
  end
end
