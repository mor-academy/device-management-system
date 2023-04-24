class OfficeInfo < ApplicationRecord
  acts_as_paranoid

  belongs_to :info, polymorphic: true

  has_rich_text :information

  validates :name, presence: true
  validates :email, :phone_number, presence: true, if: ->{info_type == Company.name}
  validates :address, presence: true, if: ->{info_type == Office.name}

  class << self
    def ransackable_attributes _auth_object = nil
      %w(name phone_number address)
    end

    def ransackable_associations _auth_object = nil
      %w(info)
    end
  end
end
