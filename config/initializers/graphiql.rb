# frozen_string_literal: true

GraphiQL::Rails.config.headers['Authorization'] = -> (context) {
  p context.request.env
  "Token #{context.request.env[:devise].current_user.try(:api_token)}"
}
