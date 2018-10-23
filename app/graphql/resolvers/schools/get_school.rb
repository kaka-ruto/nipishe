# frozen_string_literal: true

module Resolvers
  module Schools
    class GetSchool < GraphQL::Function
      argument :id, !types.ID

      type Types::SchoolType

      def call(_obj, args, _ctx)
        School.find(args[:id])
      end
    end
  end
end
