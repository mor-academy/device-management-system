FactoryBot.define do
  factory :company do
    website {Faker::Internet.url}
  end
end
