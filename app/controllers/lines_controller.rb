class LinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @area = Area.find(params[:area_id])
    @lines = policy_scope(Line.where(area: @area))
  end

  def show
    @line = Line.find(params[:id])
    authorize(@line)
  end
end
