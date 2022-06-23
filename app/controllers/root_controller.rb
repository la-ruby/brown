# frozen_string_literal: true

# Handles requests to root url
class RootController < ApplicationController
  def index
    if current_user
      redirect_to projects_path
    else
      redirect_to new_user_session_path
    end
  end
end
