# frozen_string_literal: true

class ApplicationPolicy < ActionPolicy::Base
  # Inheriting from ActionPolicy::Base adds all the authorization modules
  # described here https://actionpolicy.evilmartians.io/#/custom_policy

  # It also has `authorize :user` by default
end
