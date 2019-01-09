# frozen_string_literal: true

module Users
  # Class that gets a single user by ID
  class UpdateUserProfile < BaseInteractor
    delegate :id, :attributes, to: :context

    def call
      context.user = User.find(id)&.update!(attributes.to_h) # Use ctx[:current_user].update instead
    rescue ActiveRecord::RecordNotFound => e
      context.fail! error: e.message

      context.user
    end
  end
end
