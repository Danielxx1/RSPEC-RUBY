FactoryBot.define do
  factory :weapon do
    name { FFaker::Product.product_name }
    description { FFaker::Lorem.paragraph }
    power_base { 3000 }
    power_step { 100 }
    level { 1 }
  end
end