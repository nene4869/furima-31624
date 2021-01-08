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
    user_id               { 1 }
    created_at            { '2021-01-07 08:09:34.516625' }
    updated_at            { '2021-01-07 08:09:34.852097' }
  end
end
