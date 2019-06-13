# frozen_string_literal: true

module Users
  class UserPolicy < ApplicationPolicy
    authorize :user

    def show?
      allowed_to?(:show?, record)
    end
  end
end

