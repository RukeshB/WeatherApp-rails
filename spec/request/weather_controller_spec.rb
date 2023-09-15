require 'rails_helper'

RSpec.describe 'WeatherControllers', type: :request do
  describe 'GET /weather' do
    describe 'fail' do
      it 'paggination overflow' do
        create_list(:weather_report, 10)
        expect do
          get '/weather', headers: { 'ACCEPT' => 'application/json' }, params: { page: 100, items: 5 }
        end.to(raise_error(Pagy::OverflowError))
      end
    end

    describe 'success' do
      it 'responds with 200' do
        get '/weather', headers: { 'ACCEPT' => 'application/json' }
        expect(response).to(have_http_status(:success))
      end

      it 'without paggination' do
        size = 10
        create_list(:weather_report, size)
        get '/weather', headers: { 'ACCEPT' => 'application/json' }
        json = JSON.parse(response.body)
        expect(json['data'].size).to(eq(size))
      end

      it 'with paggination' do
        create_list(:weather_report, 10)
        get '/weather', headers: { 'ACCEPT' => 'application/json' }, params: { page: 1, items: 5 }
        json = JSON.parse(response.body)
        expect(json['data'].size).to(eq(5))
      end
    end
  end
end
