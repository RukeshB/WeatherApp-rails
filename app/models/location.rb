class Location < ApplicationRecord
  has_many :weather_reports

  validates :city, presence: true
  validates :country, presence: true
end
