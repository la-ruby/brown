# frozen_string_literal: true

class PropertiesPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true # because theres a before_action :authenticate_user!
  end
end
