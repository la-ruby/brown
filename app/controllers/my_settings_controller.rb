# frozen_string_literal: true

# My Settings Controller
class MySettingsController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
