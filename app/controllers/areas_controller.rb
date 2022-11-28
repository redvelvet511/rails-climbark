class AreasController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index search]

  def index
    @areas = policy_scope(Area)

    @markers = @areas.map do |area|
      {
        lat: area.latitude,
        lng: area.longitude,
        info_window: render_to_string(partial: "info_window", locals: {flat: flat}),
        image_url: helpers.asset_url("marker.png")
      }
    end
  end

  def search
    skip_authorization
    sql_query = "name ILIKE :query OR category ILIKE :query"
    case params[:query].present?
    when Area.where("name ILIKE ?", "%#{params[:query]}%").exists?
      @search = Area.where("name ILIKE ?", "%#{params[:query]}%")
    when Line.where(sql_query, query: "%#{params[:query]}%").exists?
      @search = Line.where(sql_query, query: "%#{params[:query]}%")
    else
      @search = Area.all
    end
  end
end
