# frozen_string_literal: true

module Types
  module Inputs
    module Users
      Login = GraphQL::InputObjectType.define do
        name 'UserLoginData'
        description 'Properties for signing in an existing user'

        argument :email, !types.String
        argument :password, !types.String
      end
    end
  end
end
