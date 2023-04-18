class UserDevice < ApplicationRecord
  acts_as_paranoid

  has_one :user_confirm_device, dependent: :destroy
  belongs_to :user
  belongs_to :device

  validates :device_id, uniqueness: {scope: [:user_id, :device_id, :deleted_at, :status]}
  validates :input_date, :output_date, presence: true

  enum status: {used: 0, using: 1, fixing: 2}
end
