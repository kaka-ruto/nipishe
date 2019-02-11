# frozen_string_literal: true

module Users
  # This class the logic for registering a new user
  class Register < BaseInteractor
    delegate :attributes, to: :context

    def call
      context.user = User.create!(attributes.to_h)
      context.auth_token = JsonWebToken.encode(user_id: context.user.id)
    rescue ActiveRecord::RecordInvalid => e
      context.fail! error: e.message

      OpenStruct.new(
        user: context.user,
        auth_token: context.auth_token
      )
    end
  end
end
