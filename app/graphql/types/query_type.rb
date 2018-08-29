# module Types
#   class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
#     field :test_field, String, null: false,
#       description: "An example field added by the generator"
#     def test_field
#       "Hello World!"
#     end
#   end
# end

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root of this schema'

  field :viewer do
    type UserType
    description 'Current User'
    resolve -> (obj, args, ctx) {
      ctx[:current_user]
    }
  end
end
