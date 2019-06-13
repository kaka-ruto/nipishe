class ApplicationController < ActionController::API
  authorize :user
  include Errors::ExceptionHandler
end
