class DeviceHistory < ApplicationRecord
  acts_as_paranoid

  belongs_to :device

  validates :input_date, :output_date, presence: true
end
