class UserSubscription < ApplicationRecord
  enum status: {disable: 0, enable: 1}, _default: :enable

  scope :by_endpoint, ->(endpoint){where endpoint:}
end
