FactoryBot.define do
  factory :user do
    email {Faker::Internet.email(domain: Settings.faker.internet.email.domain_gmail)}
    password {Faker::Number.number(digits: Settings.faker.number.digits_10)}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    office
  end
end
