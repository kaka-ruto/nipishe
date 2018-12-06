class AuthorizeApiRequest < BaseInteractor
  # before :set_headers
  delegate :headers, to: :context

  def call
    context.user ||= User.find(auth_token[:user_id]) if auth_token

  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new(
      "User with that ID not found, #{e.message}"
    )

    context.user
  end


  private

  def auth_token
    auth_token ||= JsonWebToken.decode(auth_header)
    context.fail!(error: 'Invalid token') unless auth_token
    # TODO raise Errors::ExceptionHandler::InvalidToken instead

    auth_token
  end

  def auth_header
    context.fail!(error: 'Missing token') unless headers['Authorization']

    return headers['Authorization']
  end
end
