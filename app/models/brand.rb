class Brand < ApplicationRecord
  acts_as_paranoid

  has_many :accessories, dependent: :destroy

  enum status: {enabled: 0, disabled: 1}
end
