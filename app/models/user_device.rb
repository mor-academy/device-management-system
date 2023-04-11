class UserDevice < ApplicationRecord
  acts_as_paranoid

  has_one :user_confirm_device, dependent: :destroy
  belongs_to :user
  belongs_to :device

  enum status: {ready: 0, fixing: 1, using: 2}
end
