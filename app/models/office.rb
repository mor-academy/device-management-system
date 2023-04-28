class Office < ApplicationRecord
  acts_as_paranoid

  belongs_to :company

  has_one :office_info, as: :info, dependent: :destroy

  has_many :users, dependent: :destroy
  has_many :user_devices, through: :users
  has_many :devices, dependent: :destroy
  has_many :office_infos, as: :info, dependent: :destroy

  ATTR_PARAMS = [:id, {office_infos_attributes: [:id, :name, :information, :address, :email, :phone_number]}].freeze

  accepts_nested_attributes_for :office_infos

  broadcasts_to ->(_office){:offices}, inserts_by: :prepend

  class << self
    def ransackable_attributes _auth_object = nil
      %w(id)
    end

    def ransackable_associations _auth_object = nil
      %w(office_info)
    end
  end
end
