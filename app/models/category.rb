class Category < ApplicationRecord
  acts_as_paranoid

  has_many :devices, dependent: :destroy

  enum status: {enabled: 0, disabled: 1}
end
