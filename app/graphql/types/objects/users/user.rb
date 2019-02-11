# frozen_string_literal: true

module Types
  module Objects
    module Users
      class User < Types::BaseObject
        description 'Properties returned when one user is queried'

        field :id, ID, null: false
        field :first_name, String, null: false
        field :last_name, String, null: false
        field :email, String, null: false
      end
    end
  end
end
