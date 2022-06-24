# frozen_string_literal: true

# My Settings Controller
class MySettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_settings, only: %i[update]

  def index
    authorize nil, policy_class: MySettingsPolicy
  end

  def update
    authorize(@my_settings).update(my_settings_params)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('flashes', partial: '/flashes', locals: { message: 'Saved' }),
          turbo_stream.replace(helpers.dom_id(current_user.my_settings), partial: '/my_settings/index/core',
                                                                         locals: { user: current_user })
        ]
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_my_settings
    @my_settings = MySettings.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def my_settings_params
    params.require(:my_settings).permit(:zaibatsu_username, :zaibatsu_password, :dufrenite_username,
                                        :dufrenite_password)
  end
end
