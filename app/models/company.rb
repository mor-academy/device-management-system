class Company < ApplicationRecord
  acts_as_paranoid

  has_one :office_info, as: :info, dependent: :destroy

  has_many :offices, dependent: :destroy
  has_many :devices, through: :offices
  has_many :office_infos, as: :info, dependent: :destroy

  ATTR_PARAMS = [:id, :website, {office_infos_attributes:
    [:id, :name, :information, :address, :email, :phone_number]}].freeze

  accepts_nested_attributes_for :office_infos

  broadcasts_to ->(_company){:companies}, inserts_by: :prepend

  class << self
    def ransackable_attributes _auth_object = nil
      %w(id)
    end

    def ransackable_associations _auth_object = nil
      %w(office_info)
    end
  end
end
