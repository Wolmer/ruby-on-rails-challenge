FactoryBot.define do
  factory :offer do
    price_with_discount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    discount_percentage { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    enrollment_semester { Faker::Lorem.word }
    enabled { [false,true].sample }
    start_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
  end
end