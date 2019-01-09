# frozen_string_literal: true

module Users
  # Class that gets a single user by ID
  class GetUserProfile < BaseInteractor
    delegate :id, to: :context

    def call
      context.user = User.find(id)
    rescue ActiveRecord::RecordNotFound => e
      context.fail! error: e.message

      context.user
    end
  end
end
