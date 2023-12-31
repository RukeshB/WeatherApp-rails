class WeatherController < ApplicationController
  def index
    items = params[:items]
    items ||= 10
    @pagy, @weather = pagy(WeatherReport.all, items:)

    respond_to do |format|
      format.html
      format.json do
        render json: {
          data: ActiveModel::Serializer::CollectionSerializer.new(
            @weather, serializer: WeatherReportSerializer
          ),
          pagy: @pagy
        }
      end
    end
  end

  def show
    @weather = WeatherReport.last  # get latest data
  end
end
