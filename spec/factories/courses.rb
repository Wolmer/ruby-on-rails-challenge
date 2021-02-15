FactoryBot.define do
  factory :course do
    name { Faker::University.name }
    kind { Faker::Lorem.word }
    level { Faker::Lorem.word }
    shift { Faker::Lorem.word }
    price { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
  end
end