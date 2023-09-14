FactoryBot.define do
  factory :location do
    city { Faker::Address.city }
    country { Faker::Address.country_code }
    lon { Faker::Address.longitude }
    lat { Faker::Address.latitude }
  end
end
