# frozen_string_literal: true

module Users
  # Class that gets a single user by ID
  class GetProfile < BaseInteractor
    delegate :id, to: :context

    def call
      user = User.find(id)
    rescue ActiveRecord::RecordNotFound => e
      context.fail! error: e.message

      user
    end
  end
end
