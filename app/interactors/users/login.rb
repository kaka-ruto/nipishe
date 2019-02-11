# frozen_string_literal: true

module Users
  class Login < BaseInteractor
    delegate :attributes, to: :context

    def call
      user = User.find_by(email: attributes[:email])

      if user
        if user.authenticate(attributes[:password])
          context.user = user
          context.auth_token = JsonWebToken.encode(user_id: user.id)
        else
          context.fail! error: 'Invalid password'
        end
      else
        context.fail! error: 'User not found'
      end

      OpenStruct.new(
        user: context.user,
        auth_token: context.auth_token
      )
    end
  end
end
