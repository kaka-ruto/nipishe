# frozen_string_literal: true

module Users
  # Class that gets a single user by ID
  class UpdateProfile < BaseInteractor
    delegate :user, :attributes, to: :context

    def call
      context.user = user.update!(attributes.to_h)
    rescue ActiveRecord::RecordNotFound => e
      context.fail! error: e.message

      context.user
    end
  end
end
