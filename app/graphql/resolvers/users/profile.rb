# frozen_string_literal: true

module Resolvers
  module Users
    # Class that gets one user's profile info
    class Profile < Resolvers::BaseResolver
      argument :id, ID, required: true

      type Types::Objects::Users::Profile, null: false
      type Types::Errors::UserError, null: true # Find a way to return errors also

      def resolve(id:)
        user = ::Users::GetProfile.call!(id: id).user
        
        { 'user': user,
          'errors': nil }
        rescue Interactor::Failure => e
          { 'user': nil,
            'errors': e.context.error }
      end
    end
  end
end
