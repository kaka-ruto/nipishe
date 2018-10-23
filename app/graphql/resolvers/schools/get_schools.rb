# frozen_string_literal: true

module Resolvers
  module Schools
    class GetSchools < GraphQL::Function
      type types[Types::SchoolType]

      def call(_obj, _args, _ctx)
        School.all
      end
    end
  end
end
