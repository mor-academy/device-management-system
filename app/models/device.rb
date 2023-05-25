class Device < ApplicationRecord
  acts_as_paranoid

  belongs_to :category, optional: true
  belongs_to :office
  belongs_to :brand, optional: true
  belongs_to :parent_device, class_name: Device.name, optional: true
  belongs_to :import_history, optional: true

  has_many :sub_devices, class_name: Device.name, dependent: :destroy
  has_many :device_histories, dependent: :destroy
  has_many :user_devices, dependent: :destroy
  has_many :requests, dependent: :destroy

  has_rich_text :description

  validates :name, presence: true

  has_many_attached :images

  ATTR_PARAMS = [:name, :code, :price, :source, :status, :description, :office_id, :brand_id, :category_id].freeze

  enum status: {ready: 0, fixing: 1, using: 2, draft: 3}

  scope :without_sub_device, ->{where device_id: nil}
  scope :have_parent, ->{where.not device_id: nil}
  scope :without_current_device, ->(ids){where.not id: ids}

  broadcasts_to ->(_office){:offices}, inserts_by: :prepend

  class << self
    def ransackable_attributes _auth_object = nil
      %w(name code)
    end

    def ransackable_associations _auth_object = nil
      %w(user_devices requests)
    end
  end
end
