class UserDevicesController < ApplicationController
  before_action :set_device, :users_except_using, only: %i(new create)

  def index
    @query = current_user.user_devices.ransack params[:query]
    @pagy, @user_devices = pagy @query.result.recent, items: Settings.pagy.config.page.default
  end

  def new
    @user_device = @device.user_devices.build
  end

  def create
    @user_device = @device.user_devices.build user_device_params
    if @user_device.save
      flash.now[:notice] = t ".success"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_device_params
    params.require(:user_device).permit :status, :input_date, :output_date, :user_id, :device_id
  end

  def set_device
    @device = current_user.office.devices.find_by id: params[:device_id] || params[:user_device][:device_id]
  end

  def users_except_using
    user_using = current_user.office.user_devices.using.by_device_ids @device.id
    @users_except_using = current_user.office.users.without_users user_using.select(:user_id)
  end
end
