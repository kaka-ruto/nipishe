# frozen_string_literal: true

module JsonWebToken
  class Encode < BaseInteractor
    HMAC_SECRET = Rails.application.secrets.secret_key_base

    delegate :user_id, to: :context

    def call
      # Payload must be hash
      # payload = { user_id: user_id }
      # context.token = JWT.encode(payload, HMAC_SECRET)
    end
  end
end
