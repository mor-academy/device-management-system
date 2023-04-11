class DeviceAccessory < ApplicationRecord
  acts_as_paranoid

  belongs_to :device
  belongs_to :accessory
end
