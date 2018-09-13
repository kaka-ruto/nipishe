# frozen_string_literal: true

module Mutations
  SchoolMutation = GraphQL::ObjectType.define do
    name 'SchoolMutation'
    description 'Creating, Editing and Deleting Schools'

    field :create_school, Types::SchoolType, 'Create a school' do
      argument :name, !types.String

      resolve ->(_obj, args, _ctx) do
        School.create(
          name: args[:name]
        )
      end
    end

    field :edit_school, Types::SchoolType, 'Edit a school' do
      argument :id, !types.ID
      argument :name, types.String

      resolve ->(_obj, args, _ctx) do
        school = School.find(args[:id])

        args = {
          name: args[:name]
        }

        school.update!(args)

        school
      end
    end

    field :delete_school, Types::SchoolType, 'Delete a school' do
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) do
        school = School.find(args[:id])
        school.destroy!

        'School has been successfully deleted'
      end
    end
  end
end
