class DevicesController < ApplicationController
  before_action :set_device, only: :show

  def show; end

  private

  def set_device
    return if @device = Device.find_by(id: params[:id])

    redirect_to user_devices_path, alert: t("shared.device_does_not_exist")
  end
end
