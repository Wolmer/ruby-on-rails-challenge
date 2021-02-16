FactoryBot.define do
  factory :campus do
    name { Faker::University.name }
    city { Faker::Address.city }
  end
end
