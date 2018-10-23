# frozen_string_literal: true

module Types
  module Inputs
    module Schools
      class Create < BaseInputObject
        description 'All you need in the world to start a new school'

        argument :name, String, 'You need to get this one right', required: true
      end
    end
  end
end
