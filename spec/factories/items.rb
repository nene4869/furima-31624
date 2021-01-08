FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    description           { '二つ買ってしまったので出品します' }
    category_id           { 3 }
    product_condition_id  { 2 }
    shipping_charge_id    { 3 }
    prefecture_id         { 38 }
    day_id                { 2 }
    price                 { 1000 }
   
    association :user
  end
end
