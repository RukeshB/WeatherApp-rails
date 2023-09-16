require 'rails_helper'
require 'webmock/rspec'
WebMock.disable_net_connect!

RSpec.describe WeatherDataFetcherJob, type: :job do
  let(:api_response) do
    {
      "coord": {
        "lon": 85.3167,
        "lat": 27.7167
      },
      "weather": [
        {
          "id": 211,
          "main": 'Thunderstorm',
          "description": 'thunderstorm'
        }
      ],
      "main": {
        "temp": 24.12,
        "feels_like": 24.75,
        "temp_min": 24.12,
        "temp_max": 24.12,
        "pressure": 1014,
        "humidity": 83
      },
      "wind": {
        "speed": 2.06,
        "deg": 200
      },
      "sys": {
        "country": 'NP'
      },
      "id": 1_283_240,
      "name": 'Kathmandu'
    }
  end

  describe '#perform' do
    it 'fetches weather data and creates records' do
      stub_request(:get, 'https://api.openweathermap.org/data/2.5/weather')
        .with(query: hash_including(q: 'kathmandu', units: 'metric',
                                    appid: Rails.application.credentials.openweathermap.api_key))
        .to_return(status: 200, body: api_response.to_json)

      expect { WeatherDataFetcherJob.new.perform }.to change { WeatherReport.count }.by(1)
    end

    it 'handles exceptions and errors' do
      stub_request(:get, 'https://api.openweathermap.org/data/2.5/weather')
        .with(query: hash_including(q: 'kathmandu', units: 'metric',
                                    appid: Rails.application.credentials.openweathermap.api_key))
        .to_return(status: 500)

      expect do
        WeatherDataFetcherJob.new.perform
      end.to raise_error(StandardError, 'An exception occurred: Failed to fetch weather data: 500')
    end
  end
end
