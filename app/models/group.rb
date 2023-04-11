class Group < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  has_many :group_users, dependent: :destroy
end
