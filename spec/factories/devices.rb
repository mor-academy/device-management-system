FactoryBot.define do
  factory :device do
    name {Faker::Device.model_name}
    code {Faker::Code.asin}
    source {Faker::Device.serial}
    description {Faker::Hacker.say_something_smart}
    office
  end
end
