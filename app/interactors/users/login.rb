# frozen_string_literal: true

module Users
  class Login < BaseInteractor
    delegate :attributes, to: :context

    def call
      authenticate_user(attributes)
    rescue ActiveRecord::RecordNotFound => e
      context.fail! error: e.message
    end

    private

    def authenticate_user(attributes)
      user = User.find_by!(email: attributes[:email])

      if valid_password?(user, attributes[:password])
        context.user = user
        context.auth_token = JsonWebToken.encode(user_id: user.id)
      else
        context.fail! error: 'Invalid password'
      end
    end

    def valid_password?(user, password)
      user.authenticate(password)
    end
  end
end
