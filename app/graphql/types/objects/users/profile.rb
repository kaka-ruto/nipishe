# frozen_string_literal: true

module Types
  module Objects
    module Users
      # Class identifying the fields returned when a user's profile is queried
      class Profile < Types::BaseObject
        description 'User profile info'

        field :id, ID, null: false
        field :first_name, String, null: false
        field :last_name, String, null: false
        field :email, String, null: false
        field :avatar, String, null: true
      end
    end
  end
end
