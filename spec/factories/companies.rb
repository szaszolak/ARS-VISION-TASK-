require 'faker'
FactoryGirl.define do
  factory :company do
    name {Faker::Company.name}
    country_code {Faker::Address.country_code}
  end
end
