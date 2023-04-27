module UserDevicesHelper
  def selector_statuses_user_devices
    UserDevice.statuses.keys.map{|status| [(UserDevice.human_enum_name :status, status), status]}
  end
end
