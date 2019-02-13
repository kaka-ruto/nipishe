# frozen_string_literal: true

module Users
  # Class that gets a single user by ID
  class UpdateProfile < BaseInteractor
    delegate :user, :attributes, to: :context

    def call
      user.update!(attributes.to_h)
    rescue ActiveRecord::RecordInvalid => e
      context.fail! error: e.message

      user
    end
  end
end
