class UserDevicesController < ApplicationController
  def index
    @user_devices = current_user.user_devices.recent
    @pagy, @user_devices = pagy @user_devices, items: 10
  end
end
