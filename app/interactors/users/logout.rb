# frozen_string_literal: true

module Users
  class Logout < BaseInteractor
    def call
      context.user.user = nil
      context.user.auth_token = nil
    end
  end
end

