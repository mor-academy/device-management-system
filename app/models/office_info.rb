class OfficeInfo < ApplicationRecord
  acts_as_paranoid

  belongs_to :info, polymorphic: true
end
