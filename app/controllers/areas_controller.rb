class AreasController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index search]

  def index
    @areas = policy_scope(Area)
  end

  def search
    skip_authorization
    sql_query = "name ILIKE :query OR category ILIKE :query"
    if params[:query].present?
      if Area.where("name ILIKE ?", "%#{params[:query]}%").exists?
        @search = Area.where("name ILIKE ?", "%#{params[:query]}%")
      elsif Line.where(sql_query, query: "%#{params[:query]}%").exists?
        @search = Line.where(sql_query, query: "%#{params[:query]}%")
      end
    else
      @search = Area.all
    end
  end
end
