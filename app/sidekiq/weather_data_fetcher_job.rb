class WeatherDataFetcherJob
  include Sidekiq::Job

  def perform
    api_key = Rails.application.credentials.openweathermap.api_key
    api_endpoint = 'https://api.openweathermap.org/data/2.5/weather'
    city = 'kathmandu'
    units = 'metric' # 'metric' for Celsius

    begin
      response = HTTParty.get(api_endpoint, query: {
                                q: city,
                                units:,
                                appid: api_key
                              })

      unless response.code == 200
        raise StandardError, "Failed to fetch weather data: #{response.code}"
      end

      weather_data = JSON.parse(response.body)
      location = create_location(weather_data)
      create_weather_report(weather_data, location)
    rescue StandardError => e
      raise StandardError, "An exception occurred: #{e.message}"
    end
  end

  private

  def create_location(weather_data)
    location_attributes = {
      city: weather_data['name'],
      country: weather_data['sys']['country'],
      lon: weather_data['coord']['lon'],
      lat: weather_data['coord']['lat']
    }

    Location.find_or_create_by(location_attributes)
  end

  def create_weather_report(weather_data, location)
    weather_attributes = {
      weather: weather_data['weather'].first['main'],
      description: weather_data['weather'].first['description'],
      temp: weather_data['main']['temp'],
      temp_min: weather_data['main']['temp_min'],
      temp_max: weather_data['main']['temp_max'],
      pressure: weather_data['main']['pressure'],
      humidity: weather_data['main']['humidity'],
      wind: weather_data['wind'],
      location:
    }

    WeatherReport.create(weather_attributes)
  end
end
