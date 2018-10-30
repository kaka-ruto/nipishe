# frozen_string_literal: true

module Resolvers
  module Schools
    class GetSchools < GraphQL::Function
      type Types::Objects::Schools::SchoolObject
      type ![String]

      def call(_obj, _args, _ctx)
        schools = School.all # later, find only schools created by user

        {
          school: schools,
          errors: []
        }
      rescue ActiveRecord::RecordNotFound => err
        {
          school: nil,
          errors: err.to_s
        }
      end
    end
  end
end
