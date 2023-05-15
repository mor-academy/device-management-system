FactoryBot.define do
  factory :request do
    type_request {:repair}
    status {:forwarded}
    user
    device
  end
end
