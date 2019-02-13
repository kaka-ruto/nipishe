# frozen_string_literal: true

module QueryTypes
  UserQueryType = GraphQL::ObjectType.define do
    name 'UserQueryType'
    description 'Get one/all users'

    field :users, types[Types::UserType], 'Get all users' do
      resolve ->(_obj, _args, _ctx) { User.all }
    end

    field :user, Types::UserType, 'Get one user' do
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) {
        User.find(args[:id])
      }
    end
  end
end