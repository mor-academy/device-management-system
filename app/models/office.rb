class Office < ApplicationRecord
  acts_as_paranoid

  belongs_to :company

  has_many :users, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :office_infos, as: :info, dependent: :destroy
end
