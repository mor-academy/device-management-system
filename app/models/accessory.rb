class Accessory < ApplicationRecord
  acts_as_paranoid

  belongs_to :brand

  has_many :device_accessories, dependent: :destroy
end
