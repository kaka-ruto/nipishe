# frozen_string_literal: true

module Resolvers
  module Users
    # Class that gets one user's profile info
    class Profile < Resolvers::BaseResolver
      argument :id, ID, required: true

      type Types::Objects::Users::Profile, null: false
      type Types::Errors::UserError, null: true # Find a way to return errors also

      def resolve(id:)
        user = User.find(id)
        
        { 'user': user,
          'errors': nil }
        rescue ActiveRecord::RecordNotFound => e
          { 'user': nil,
            'errors': e.message }
      end
    end
  end
end
