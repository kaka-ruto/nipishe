# frozen_string_literal: true

module Mutations
  module Users
    # This class initiates the user signup process
    class Register < Mutations::BaseMutation
      argument :params, Types::Inputs::Users::Registration, required: true

      field :user, Types::Objects::Users::User, null: true
      field :auth_token, String, null: true
      field :errors, [String], null: true

      def resolve(params:)
        result = ::Users::Register.call(attributes: params)

        if result.success?
          {
            user: result.user,
            auth_token: result.auth_token
          }
        else
          {
            errors: [result.context.error]
          }
        end
      end
    end
  end
end
