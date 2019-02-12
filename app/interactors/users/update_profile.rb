# frozen_string_literal: true

module Users
  # Class that gets a single user by ID
  class UpdateProfile < BaseInteractor
    delegate :user, :attributes, to: :context

    def call
      # binding.pry
      user.update!(attributes.to_h)

      user
    end
  end
end
