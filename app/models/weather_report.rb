class WeatherReport < ApplicationRecord
  belongs_to :location

  validates :weather, presence: true
  validates :description, presence: true
  validates :temp, presence: true
end
