# frozen_string_literal: true

module Users
  # This class the logic for registering a new user
  class Register < BaseInteractor
    delegate :attributes, to: :context

    def call
      create_user_with_token(attributes)
    rescue ActiveRecord::RecordInvalid => e
      context.fail! error: e.message
    end

    private

    def create_user_with_token(attributes)
      context.user = User.create!(attributes.to_h)
      context.auth_token = JsonWebToken.encode(user_id: context.user.id)

      OpenStruct.new(
        user: context.user,
        auth_token: context.auth_token
      )
    end
  end
end
