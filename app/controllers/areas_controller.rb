class AreasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @areas = policy_scope(Area)
  end

  def search
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @areas = Area.where("name ILIKE ?", "%#{params[:query]}%")
      @lines = Line.where(sql_query, query: "%#{params[:query]}%")
    else
      @areas = Area.all
      @lines = Line.all
    end
  end
end
