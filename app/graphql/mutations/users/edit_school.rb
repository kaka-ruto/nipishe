# frozen_string_literal: true

module Mutations
  module Schools
    class EditSchool < Mutations::BaseMutation
      argument :id, ID, 'You need to get this one right', required: true
      argument :attributes, Types::Inputs::Schools::CreateSchoolInput, required: true

      field :school, Types::Objects::Schools::SchoolObject, null: true
      field :errors, [String], null: false

      def resolve(id:, attributes:)
        school = School.find(id)
        school.update!(attributes.to_h)

        {
          school: school,
          errors: []
        }
      rescue ActiveRecord::RecordNotFound => err
        {
          school: nil,
          errors: [err.to_s]
        }
      rescue ActiveRecord::RecordInvalid => err
        {
          school: school,
          errors: [err.to_s]
        }
      end
    end
  end
end
