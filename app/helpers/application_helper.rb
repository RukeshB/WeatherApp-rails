module ApplicationHelper
  include Pagy::Frontend

  def format_date_time(date_time)
    date_time.strftime('%A, %B %d, %Y %H:%M')
  end
end
