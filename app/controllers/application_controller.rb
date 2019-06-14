class ApplicationController < ActionController::API
  include Errors::ExceptionHandler
rescue_from ActionPolicy::Unauthorized do |e|
  {
    'details': e.result.reasons.details
  }
end
end
