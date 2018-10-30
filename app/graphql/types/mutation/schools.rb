# frozen_string_literal: true

module Types
  module Mutation
    class Schools < Types::BaseObject
      field :create_school, mutation: Mutations::Schools::CreateSchool
      field :edit_school, mutation: Mutations::Schools::EditSchool
    end
  end
end
