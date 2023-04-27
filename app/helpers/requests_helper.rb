module RequestsHelper
  def selector_type_requests
    Request.type_requests.keys.map do |type_request|
      [(Request.human_enum_name :type_request, type_request), type_request]
    end
  end

  def selector_devices_by_office devices
    devices.map{|device| ["#{device.id}: #{device.name} - #{device.code}", device.id]}
  end
end
