# frozen_string_literal: true

class ApplicationPolicy < ActionPolicy::Base
  # Inheriting from ActionPolicy::Base adds all the authorization modules
  # described here https://actionpolicy.evilmartians.io/#/custom_policy

  # The following functionality is available out of the box

  # include ActionPolicy::Policy::Core
  # include ActionPolicy::Policy::Authorization
  # include ActionPolicy::Policy::PreCheck
  # include ActionPolicy::Policy::Reasons
  # include ActionPolicy::Policy::Aliases
  # include ActionPolicy::Policy::Cache
  # include ActionPolicy::Policy::CachedApply
  # include ActionPolicy::Policy::Defaults

  # ActionPolicy::Policy::Defaults module adds the following

  # authorize :user

  # default_rule :manage?
  # alias_rule :new?, to: :create?

  # def index?
  #   false
  # end

  # def create?
  #   false
  # end

  # def manage?
  #   false
  # end
end
