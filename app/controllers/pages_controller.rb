class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search landing]

  def landing
  end

  def home
    @areas = Area.all

    @markers = @areas.map do |area|
      {
        lat: area.latitude,
        lng: area.longitude,
        info_window: render_to_string(partial: "info_window", locals: {area: area}),
        image_url: helpers.asset_url("mtn.png")
      }
    end
  end
end
