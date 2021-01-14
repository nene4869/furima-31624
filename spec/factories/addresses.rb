FactoryBot.define do
  factory :address do

      postal_code           { "534-0022" }
      prefecture_id         { 5 }
      municipalities        { "大阪市都島区都島本通" }
      house_number          {"2-2-2" }
      building_name         { "田仲ビル" }
      phone_number          { "080-5432-3456" }
     
     
      association :order
    
  end
end
