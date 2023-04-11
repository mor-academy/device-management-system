class DeviceHistory < ApplicationRecord
  acts_as_paranoid

  belongs_to :device
end
