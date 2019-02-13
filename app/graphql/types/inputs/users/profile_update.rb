# frozen_string_literal: true

module Types
  module Inputs
    module Users
      # Contains all fields a user might want to edit
      class ProfileUpdate < BaseInputObject
        description 'Properties for registering a new user'

        argument :first_name, String, required: false
        argument :last_name, String, required: false
        argument :email, String, required: false
        argument :password, String, required: false
      end
    end
  end
end
