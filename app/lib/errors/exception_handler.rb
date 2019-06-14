module Errors
  module ExceptionHandler
    extend ActiveSupport::Concern

    # Define custom error subclasses, since rescue catches 'StandardErrors'
    class ApplicationError < StandardError; end

    # Client errors
    class ResponseError < ApplicationError; end

    class AuthenticationError < ResponseError; end
    class MissingToken < ResponseError; end
    class InvalidToken < ResponseError; end

    # Define custom handlers
    included do
      rescue_from ActiveRecord::RecordInvalid, with: :response_error
      rescue_from ActiveRecord::RecordNotFound, with: :response_error
      rescue_from Errors::ExceptionHandler::AuthenticationError,
        with: :response_error
      rescue_from Errors::ExceptionHandler::MissingToken,
        with: :response_error
      rescue_from Errors::ExceptionHandler::InvalidToken,
        with: :response_error
      rescue_from ActionPolicy::Unauthorized, with: :unauthorized_error
    end

    private

    def response_error(e)
      binding.pry # TODO: find out why this is not called
      render json: { error: e.message }
    end

    def unauthorized_error(e)
      raise GraphQL::ExecutionError.new(
        e.result.message,
        extensions: {
          code: :unauthorized,
          fullMessages: e.result.reasons.full_messages,
          details: e.result.reasons.details
        }
      )
    end
  end
end
