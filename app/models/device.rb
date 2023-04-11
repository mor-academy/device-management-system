class Device < ApplicationRecord
  acts_as_paranoid

  belongs_to :category, optional: true
  belongs_to :office

  has_many :devices_accessories, dependent: :destroy
  has_many :devices_histories, dependent: :destroy
  has_many :user_devices, dependent: :destroy
  has_many :requests, dependent: :destroy

  enum status: {ready: 0, fixing: 1, using: 2}
end
