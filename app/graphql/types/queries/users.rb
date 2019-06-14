# frozen_string_literal: true

module Types
  module Queries
    class Users < Types::BaseObject
      field :profile, resolver: ::Queries::Users::Profile,
        authorize: { to: :show?, with: ::Users::UserPolicy }
    end
  end
end
