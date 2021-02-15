FactoryBot.define do
  factory :university do
    name { Faker::University.suffix }
    score { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    logo_url { Faker::LoremPixel.image(size: "50x60") }
  end
end