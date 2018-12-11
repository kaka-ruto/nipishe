# frozen_string_literal: true

module Resolvers
  module Users
    class Register < GraphQL::Function
      argument :attributes, !Types::Inputs::Users::Register

      type Types::LoginPayload

      def call(_obj, args, _ctx)
        resource = User.create!(args[:attributes].to_h)

        auth_token = resource.generate_auth_token
        successful_login(auth_token, resource)

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new(
          "Invalid attributes for #{e.record.class.name}: #{e.record.errors.full_messages.join(', ')}"
        )
      end

      private

      def successful_login(auth_token, resource)
        OpenStruct.new(
          auth_token: auth_token,
          user: resource,
          message: ''
        ) # status: 302 temporary redirection to /secured
      end
    end
  end
end
