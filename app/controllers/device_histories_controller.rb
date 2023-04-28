class DeviceHistoriesController < ApplicationController
  before_action :set_device, only: %i(new create)

  def new
    @device_history = @device.device_histories.build
  end

  def create
    @device_history = @device.device_histories.build device_history_params
    if @device_history.save
      respond_to do |format|
        format.turbo_stream{flash.now[:notice] = t(".success")}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def device_history_params
    params.require(:device_history).permit :input_date, :output_date
  end

  def set_device
    return if @device = current_user.office.devices.find_by(id: params[:device_id])

    redirect_to user_devices_path, alert: t("shared.device_does_not_exist")
  end
end
