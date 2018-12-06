# frozen_string_literal: true

module Auth
  class LoginUser < BaseInteractor
    delegate :email, :password, to: :context

    def call
      user = User.find_by(email: email)

      if user
        if user.authenticate(password)
          auth_token = JsonWebToken.encode(user_id: user.id)
        else
          context.fail! error: 'Invalid password'
        end
      else
        context.fail! error: 'User not found'
      end

      context.user_object = {
        user: user,
        auth_token: auth_token
      }
    end
  end
end
