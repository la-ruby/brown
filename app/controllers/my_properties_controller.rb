# frozen_string_literal: true

# My Properties Controller
class MyPropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @properties = current_user.properties
    authorize nil, policy_class: PropertiesPolicy
  end
end
