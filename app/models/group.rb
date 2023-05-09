class Group < ApplicationRecord
  acts_as_paranoid

  belongs_to :project_manager, class_name: User.name, optional: true

  has_many :group_users, dependent: :destroy
end
