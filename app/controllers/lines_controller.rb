class LinesController < ApplicationController

  def index
    @area = Area.find(params[:area_id])
    @lines = Line.where(area: @area)
    @lines = policy_scope(Line)
  end

  def show
    @line = Line.find(params[:id])
  end
end
