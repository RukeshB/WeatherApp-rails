class WeatherReportSerializer < ActiveModel::Serializer
  attributes :id, :weather, :description, :temp, :temp_min, :temp_max, :pressure, :humidity, :wind

  belongs_to :location
end
