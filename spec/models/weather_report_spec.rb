require 'rails_helper'

# run this command to test rspec spec/models/weather_report_spec.rb -f d

RSpec.describe WeatherReport, type: :model do
  let(:weather) { create(:weather_report) }

  describe 'Valid' do
    it 'all data present' do
      expect(weather).to(be_valid)
    end
  end

  describe 'InValid' do
    it 'weather not Present' do
      weather.weather = nil
      expect(weather).not_to(be_valid)
    end

    it 'description not Present' do
      weather.description = nil
      expect(weather).not_to(be_valid)
    end

    it 'temp not Present' do
        weather.temp = nil
        expect(weather).not_to(be_valid)
      end
  end
end
