class AddIconToWeatherReports < ActiveRecord::Migration[7.0]
  def change
    add_column :weather_reports, :icon, :string
  end
end
