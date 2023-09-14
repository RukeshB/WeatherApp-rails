class WeatherController < ApplicationController
  def index
    @pagy, @weather = pagy(WeatherReport.all, items: params[:items])

    respond_to do |format|
      format.html # show.html.erb
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
end
