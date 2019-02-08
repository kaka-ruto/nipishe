# frozen_string_literal: true

module Types
  module Inputs
    module Users
      # Contains fields required to sign up
      class UserRegistrationInput < BaseInputObject
        description 'Properties for registering a new user'

        argument :first_name, String, required: true
        argument :last_name, String, required: true
        argument :email, String, required: true
        argument :password, String, required: true
      end
    end
  end
end
