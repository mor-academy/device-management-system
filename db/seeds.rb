number_of_records = 20
number_of_records.times do |_|
  company_params = {
    name: Faker::Company.name,
    information: Faker::Company.industry,
    email: Faker::Internet.email(domain: "gmail.com"),
    phone_number: Faker::Company.russian_tax_number
  }
  company = Company.new website: Faker::Internet.url
  company.office_infos&.build company_params

  company.save
  p company.inspect
end

number_of_records.times do |_|
  office_params = {
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email(domain: "gmail.com"),
    phone_number: Faker::Company.russian_tax_number
  }
  office = Company.first&.offices&.build&.office_infos&.build office_params
  office.save
  p office.inspect
end

number_of_records.times do |_|
  office = Office.first
  user_params = {
    email: Faker::Internet.email(domain: "gmail.com"),
    password: "123456abcd",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  }
  user = office.users.build user_params
  user.save
  p user.inspect
end

number_of_records.times do |_|
  user_params = {
    email: Faker::Internet.email(domain: "gmail.com"),
    password: "123456abcd",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  }
  user = User.create user_params
  p user.inspect
end
