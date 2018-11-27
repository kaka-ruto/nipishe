# frozen_string_literal: true

module Mutations
  module Schools
    class DeleteSchool < Mutations::BaseMutation
      argument :id, ID, 'You need to get this one right', required: true

      field :errors, [String], null: false

      def resolve(id:)
        school = School.find(id)
        school.destroy!

        {
          message: "School deleted. We know you're coming up with another one :)",
          errors: []
        }
      rescue ActiveRecord::RecordNotFound => err
        {
          school: nil,
          errors: [err.to_s]
        }
      rescue StandardError => err
        {
          school: nil,
          errors: [err.to_s]
        }
      end
    end
  end
end
