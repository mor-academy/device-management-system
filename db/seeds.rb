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

  device_params = {
    name: Faker::Device.model_name,
    code: Faker::Code.asin,
    source: Faker::Device.serial,
    office_id: office.id
  }
  device = Device.create! device_params
  user = User.last
  user_devices_params = {
    input_date: Faker::Date.between(from: "2020-03-20", to: Date.today),
    output_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    user_id: user.id
  }
  device.user_devices.create! user_devices_params
end
