class ApplicationController < ActionController::API
  include Pundit
  include Errors::ExceptionHandler
end
