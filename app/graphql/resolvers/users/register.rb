# frozen_string_literal: true

module Resolvers
  module Users
    class Register < GraphQL::Function
      argument :registration_data, !Types::Inputs::Users::Register

      type Types::UserType

      def call(_obj, args, _ctx)
        User.create!(args[:registration_data].to_h)
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new(
          "Invalid attributes for #{e.record.class.name}: #{e.record.errors.full_messages.join(', ')}"
        )
      end
    end
  end
end
