# frozen_string_literal: true

class JsonWebToken
  HMAC_SECRET = ENV['RAILS_MASTER_KEY']

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    # TODO Raise exception instead of a nil which may cause errors
    # raise Errors::ExceptionHandler::InvalidToken, e.message
    nil
  end
end
