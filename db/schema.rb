# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_13_042745) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "weather_reports", force: :cascade do |t|
    t.decimal "lon", precision: 10, scale: 2
    t.decimal "lat", precision: 10, scale: 2
    t.decimal "temp", precision: 10, scale: 2
    t.decimal "temp_min", precision: 10, scale: 2
    t.decimal "temp_max", precision: 10, scale: 2
    t.decimal "pressure", precision: 10, scale: 2
    t.decimal "humidity", precision: 10, scale: 2
    t.decimal "wind_speed", precision: 10, scale: 2
    t.decimal "wind_deg", precision: 10, scale: 2
    t.string "weather"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "loaction"
  end

end
