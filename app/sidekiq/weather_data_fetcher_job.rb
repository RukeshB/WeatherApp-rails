class WeatherDataFetcherJob
  include Sidekiq::Job

  def perform
    api_key = 'b7aef3568e4ecac4c88469f2789d2992'
    api_endpoint = 'https://api.openweathermap.org/data/2.5/weather'
    city = 'kathmandu'
    units = 'metric' # 'metric' for Celsius

    # Make an HTTP request to the OpenWeatherMap API
    response = HTTParty.get(api_endpoint, query: {
                              q: city,
                              units:,
                              appid: api_key
                            })

    if response.code == 200
      # Parse the JSON response and extract the data
      weather_data = JSON.parse(response.body)

      # save the weather data to database
      WeatherReport.create(
        lon: weather_data['coord']['lon'],
        lat: weather_data['coord']['lat'],
        weather: weather_data['weather'].first['main'],
        description: weather_data['weather'].first['description'],
        temp: weather_data['main']['temp'],
        temp_min: weather_data['main']['temp_min'],
        temp_max: weather_data['main']['temp_max'],
        pressure: weather_data['main']['pressure'],
        humidity: weather_data['main']['humidity'],
        wind_speed: weather_data['wind']['speed'],
        wind_deg: weather_data['wind']['deg'],
        loaction: weather_data['name']
      )
    else
      # Handle API request errors
      Rails.logger.error("Failed to fetch weather data: #{response.code} - #{response.message}")
    end
  end
end
