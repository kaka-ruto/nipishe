# frozen_string_literal: true

module Mutations
  FacultyMutation = GraphQL::ObjectType.define do
    name 'FacultyMutation'
    description 'Creating, Editing and Deleting Faculties'

    field :create_faculty, Types::FacultyType, 'Create a faculty' do
      argument :school_id, !types.ID
      argument :name, !types.String

      resolve ->(_obj, args, _ctx) do
        school = School.find(args[:school_id])

        if school
          school.faculties.create!(
            name: args[:name]
          )
        else
          return 'Could not find the school specified; create a school first, then add faculties to it :)'
        end
      end
    end

    field :edit_faculty, Types::FacultyType, 'Edits a faculty' do
      argument :school_id, !types.ID
      argument :faculty_id, !types.ID
      argument :name, !types.String

      resolve ->(_obj, args, _ctx) do
        school = School.find(args[:school_id])
        faculty = school.faculties.find(args[:faculty_id]) if school

        if faculty
          faculty.update!(
            name: args[:name]
          )

          faculty
        else
          return 'Could not the find the specified faculty'
        end
      end
    end

    field :delete_faculty, Types::FacultyType, 'Deletes a faculty' do
      argument :school_id, !types.ID
      argument :faculty_id, !types.ID

      resolve ->(_obj, args, _ctx) do
        school = School.find(args[:school_id])
        faculty = school.faculties.find(args[:faculty_id]) if school

        if faculty
          faculty.destroy!
        else
          return 'Could not the find the specified faculty'
        end
      end
    end
  end
end
