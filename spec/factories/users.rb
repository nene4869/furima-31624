FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { 'nene0408' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    surname               {"中澤"}
    family_name           {"弥音"}
    surname_k             {"ナカザワ"}
    family_name_k         {"ネネ"}
    birth_date            {"1993-04-08"}


  end
end