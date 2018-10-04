# frozen_string_literal: true

module Resolvers
  module Users
    class Create < GraphQL::Function
      argument :attributes, !Types::Inputs::Users::Create

      type Types::UserType

      def call(_obj, args, _ctx)
        User.create!(args[:attributes].to_h)
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new(
          "Invalid attributes for #{e.record.class.name}: #{e.record.errors.full_messages.join(', ')}"
        )
      end
    end
  end
end
