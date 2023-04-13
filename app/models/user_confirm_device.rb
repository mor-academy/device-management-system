class UserConfirmDevice < ApplicationRecord
  acts_as_paranoid

  belongs_to :user_device

  enum admin_device_status: {good: 0, not_good: 1}, _prefix: true
  enum staff_device_status: {good: 0, not_good: 1}, _prefix: true
end
