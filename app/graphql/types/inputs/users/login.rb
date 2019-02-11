# frozen_string_literal: true

module Types
  module Inputs
    module Users
      class Login < BaseInputObject
        description 'Properties for signing in an existing user'

        argument :email, String, required: true
        argument :password, String, required: true
      end
    end
  end
end
