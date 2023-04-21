class DevicesController < ApplicationController
  before_action :set_device, only: %i(show new_sub_devices add_sub_devices)
  before_action :check_device_ids_present, only: :add_sub_devices

  def show; end

  def new_sub_devices
    @sub_devices = current_user.office.devices.without_sub_device.recent
  end

  def add_sub_devices
    @sub_devices = current_user.office.devices.without_sub_device.by_ids params[:device_ids]
    @sub_devices.update device_id: @device.id
  end

  private

  def set_device
    return if @device = current_user.office.devices.find_by(id: params[:id])

    redirect_to user_devices_path, alert: t("shared.device_does_not_exist")
  end

  def check_device_ids_present
    if params[:device_ids].present?
      respond_to do |format|
        format.turbo_stream{flash.now[:notice] = t(".success")}
      end
    else
      respond_to do |format|
        format.turbo_stream{flash.now[:alert] = t(".failed")}
      end
    end
  end
end
