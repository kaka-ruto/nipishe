# frozen_string_literal: true

module Mutations
  module Schools
    class CreateSchool < Mutations::BaseMutation
      argument :attributes, Types::Inputs::Schools::CreateSchoolInput, required: true

      field :school, Types::Objects::Schools::SchoolObject, null: true
      field :errors, [String], null: false

      def resolve(attributes:)
        school = School.create(attributes.to_h)

        if school.save
          {
            school: school,
            errors: []
          }
        else
          errors = school.errors.full_messages

          {
            school: school,
            errors: errors
          }
        end
      end
    end
  end
end
