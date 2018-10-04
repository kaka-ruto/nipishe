# frozen_string_literal: true

module Types
  UserType = GraphQL::ObjectType.define do
    name 'UserType'
    description 'Return these attributes when querying a user'

    field :id, types.ID
    field :first_name, types.String
    field :last_name, types.String
    field :email, !types.String
    field :updated_at do
      type types.ID
      resolve ->(obj, _args, _ctx) {
        obj.updated_at.to_i
      }
    end
    field :created_at do
      type types.ID
      resolve ->(obj, _args, _ctx) {
        obj.created_at.to_i
      }
    end
  end
end
