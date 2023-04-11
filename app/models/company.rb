class Company < ApplicationRecord
  acts_as_paranoid

  has_many :offices, dependent: :destroy
  has_many :office_infos, as: :info, dependent: :destroy
end
