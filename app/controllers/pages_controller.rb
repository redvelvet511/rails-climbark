class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search landing map]

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
end

# https://images.unsplash.com/photo-1549880181-56a44cf4a9a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80
# https://images.unsplash.com/photo-1544198365-f5d60b6d8190?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80
# https://images.unsplash.com/photo-1480497490787-505ec076689f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80
