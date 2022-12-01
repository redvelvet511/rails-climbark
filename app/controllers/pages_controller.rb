class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[landing home map search]

  def landing
  end

  def home
    @recommended_areas = [
      @area1 = Area.near([46.469, -80.976], 140, order: :distance).first,
      @area2 = Area.near([46.469, -80.976], 140, order: :distance).second,
      @area3 = Area.near([46.469, -80.976], 140, order: :distance).third
    ]

    @mymarker = {
      lat: 46.469,
      lng: -80.976,
      image_url: helpers.asset_url("your_location.png")
    }

    @markers = @recommended_areas.map do |recommended_area|
      {
        lat: recommended_area.latitude,
        lng: recommended_area.longitude,
        info_window: render_to_string(partial: "info_window", locals: {area: recommended_area}),
        image_url: helpers.asset_url("marker.png")
      }
    end
  end

  def map
    @areas = Area.all

    @mymarker = {
      lat: 46.469,
      lng: -80.976,
      image_url: helpers.asset_url("your_location.png")
    }

    @markers = @areas.map do |area|
      {
        lat: area.latitude,
        lng: area.longitude,
        info_window: render_to_string(partial: "info_window", locals: { area: area }),
        image_url: helpers.asset_url("marker.png")
      }
    end
  end

  def search
    if params[:query].present?
      pg_results = PgSearch.multisearch(params[:query])
      @areas = []
      @lines = []

      unless pg_results.empty?
        results = pg_results.map(&:searchable)
        results.each do |result|
          @areas << result if result.is_a?(Area)
          @lines << result if result.is_a?(Line)
        end
      end
    else
      @areas = policy_scope(Area)
      @lines = policy_scope(Line)
    end
  end
end

# sql_query = "name ILIKE :query OR category ILIKE :query"
# case params[:query].present?
# when Area.where("name ILIKE ?", "%#{params[:query]}%").exists?
#   @search = Area.where("name ILIKE ?", "%#{params[:query]}%")
# when Line.where(sql_query, query: "%#{params[:query]}%").exists?
#   @search = Line.where(sql_query, query: "%#{params[:query]}%")
# else
#   @search = Area.all
# end

# https://images.unsplash.com/photo-1549880181-56a44cf4a9a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80
# https://images.unsplash.com/photo-1544198365-f5d60b6d8190?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80
# https://images.unsplash.com/photo-1480497490787-505ec076689f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80
