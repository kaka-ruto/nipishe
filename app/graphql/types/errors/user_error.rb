module Types
  module Errors

    # Returns the error message and it's path
    class UserError < Types::BaseObject
      description 'User-readable error object'

      field :message, String,
        null: false,
        description: 'Description of the error'

      field :path, [String],
        null: true,
        description: 'Which input value this error came from'
    end
  end
end
