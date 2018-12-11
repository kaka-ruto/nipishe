# frozen_string_literal: true

# This class authorizes all API requests, ensuring that they have a valid token and user payload
# It returns the current_user
class AuthorizeApiRequest < BaseInteractor
  delegate :headers, to: :context

  def call
    current_user ||= User.find(auth_token[:user_id]) if auth_token
  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new(
      "User with that ID not found, #{e.message}"
    )

    context.user = current_user
  end

  private

  def auth_token
    auth_token ||= JsonWebToken.decode(auth_header)
    context.fail!(error: 'Invalid token') unless auth_token
    # TODO: raise Errors::ExceptionHandler::InvalidToken instead

    auth_token
  end

  def auth_header
    context.fail!(error: 'Missing token') unless headers['Authorization']

    headers['Authorization']
  end
end
