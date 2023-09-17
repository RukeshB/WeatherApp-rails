module ApplicationHelper
  include Pagy::Frontend

  def format_date_time(date_time)
    date_time.strftime('%A, %B %d, %Y %H:%M')
  end

  def icon_url(icon_code)
    "https://openweathermap.org/img/wn/#{icon_code}@2x.png"
  end
end
