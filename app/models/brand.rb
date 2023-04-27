class Brand < ApplicationRecord
  acts_as_paranoid

  has_many :devices, dependent: :nullify

  enum status: {enabled: 0, disabled: 1}

  scope :by_name, ->(name){where name:}
end
