# froze_string_literal

module Mutations
  module Users
    class Logout < Mutations::BaseMutation
      argument :user_id, Integer, required: true

      field :message, String, null: false

      def resolve(user_id:)
        user = User.find(user_id)
        logout_user(user)
      end

      private

      def logout_user(user)
        ::Users::Logout.call(user: user)

        {
          message: 'Successfully Signed Out',
        }
      end
    end
  end
end

