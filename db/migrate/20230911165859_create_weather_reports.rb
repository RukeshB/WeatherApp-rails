class CreateWeatherReports < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_reports do |t|
      t.decimal :temp, precision: 10, scale: 2, null: false
      t.decimal :temp_min, precision: 10, scale: 2
      t.decimal :temp_max, precision: 10, scale: 2
      t.decimal :pressure, precision: 10, scale: 2
      t.decimal :humidity, precision: 10, scale: 2
      t.json :wind
      t.string :weather, null: false
      t.string :description, null: false
      t.belongs_to :location

      t.timestamps
    end
  end
end
