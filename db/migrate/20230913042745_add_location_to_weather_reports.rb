class AddLocationToWeatherReports < ActiveRecord::Migration[7.0]
  def change
    add_column :weather_reports, :loaction, :string
  end
end
