class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.decimal :lon, precision: 10, scale: 2
      t.decimal :lat, precision: 10, scale: 2
      t.string :city, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
