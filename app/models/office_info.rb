class OfficeInfo < ApplicationRecord
  acts_as_paranoid

  belongs_to :info, polymorphic: true

  validates :name, presence: true
  validates :email, :phone_number, presence: true, if: ->{info_type == "Company"}
  validates :address, presence: true, if: ->{info_type == "Office"}
end
