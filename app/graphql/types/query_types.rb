# frozen_string_literal: true

module Types
  class QueryTypes < Types::BaseObject
    field :profile, resolver: Resolvers::Users::Profile,
                    authorize: { to: :show?, with: Users::UserPolicy }
  end
end
