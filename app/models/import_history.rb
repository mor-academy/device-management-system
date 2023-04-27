class ImportHistory < ApplicationRecord
  acts_as_paranoid

  belongs_to :author, class_name: User.name, optional: true

  has_many :devices, dependent: :nullify
end
