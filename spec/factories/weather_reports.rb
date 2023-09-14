FactoryBot.define do
  factory :weather_report do
    temp { 24.12 }
    temp_min { 24.12 }
    temp_max { 24.12 }
    pressure { 1014 }
    wind do
      {
        "speed": 2.06,
        "deg": 200
      }
    end
    weather { 'Thunderstorm' }
    description { 'thunderstorm' }
    location { create(:location) }
  end
end
