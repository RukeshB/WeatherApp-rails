class CreateWeatherReports < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_reports do |t|
      t.decimal :lon, precision: 10, scale: 2
      t.decimal :lat, precision: 10, scale: 2
      t.decimal :temp, precision: 10, scale: 2
      t.decimal :temp_min, precision: 10, scale: 2
      t.decimal :temp_max, precision: 10, scale: 2
      t.decimal :pressure, precision: 10, scale: 2
      t.decimal :humidity, precision: 10, scale: 2
      t.decimal :wind_speed, precision: 10, scale: 2
      t.decimal :wind_deg, precision: 10, scale: 2
      t.string :weather
      t.string :description

      t.timestamps
    end
  end
end
