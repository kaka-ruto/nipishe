# frozen_string_literal: true

module Types
  module Inputs
    module Users
      Register = GraphQL::InputObjectType.define do
        name 'UserRegistrationData'
        description 'Properties for registering a new user'

        argument :first_name, !types.String
        argument :last_name, !types.String
        argument :email, !types.String
        argument :password, !types.String
      end
    end
  end
end
