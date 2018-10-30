# frozen_string_literal: true

module Types
  module Inputs
    module Schools
      class CreateSchoolInput < BaseInputObject
        description 'All you need in the world to start a new school'

        argument :name, String, 'You need to get this one right', required: true
        argument :type_of_school, String, required: false
        argument :year_of_founding, String, required: false
      end
    end
  end
end
