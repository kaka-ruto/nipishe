# frozen_string_literal: true

module Resolvers
  module Schools
    class GetSchool < GraphQL::Function
      argument :id, !types.ID

      type Types::Objects::Schools::SchoolObject
      type ![String]

      def call(_obj, args, _ctx)
        school = School.find(args[:id])

        {
          school: school,
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
