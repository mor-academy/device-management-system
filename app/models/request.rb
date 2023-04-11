class Request < ApplicationRecord
  acts_as_paranoid

  belongs_to :device
  belongs_to :user
end
