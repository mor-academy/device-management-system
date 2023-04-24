class UserDevice < ApplicationRecord
  acts_as_paranoid

  has_one :user_confirm_device, dependent: :destroy
  belongs_to :user
  belongs_to :device

  validates :device_id, uniqueness: {scope: [:user_id, :device_id, :deleted_at, :status]}
  validates :input_date, :output_date, presence: true

  scope :by_device_ids, ->(ids){where device_id: ids}

  enum status: {used: 0, using: 1, fixing: 2}

  class << self
    def ransackable_attributes _auth_object = nil
      %w(id status input_date output_date)
    end

    def ransackable_associations _auth_object = nil
      %w(device)
    end
  end
end
