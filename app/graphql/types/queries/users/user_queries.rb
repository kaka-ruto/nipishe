# frozen_string_literal: true

module Types
  module Queries
    module Users
      class UserQueries < Types::BaseObject
        field :profile, resolver: ::Queries::Users::GetProfile
      end
    end
  end
end
