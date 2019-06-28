# frozen_string_literal: true

module Users
  class Logout < BaseInteractor
    def call
      context.user = nil
      context.auth_token = nil
    end
  end
end

