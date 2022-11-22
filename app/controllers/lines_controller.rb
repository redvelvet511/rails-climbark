class LinesController < ApplicationController

  def index
    @area = Area.find(params[:area_id])
    @lines = policy_scope(Line.where(area: @area))
  end

  def show
    @line = Line.find(params[:id])
    @lines = policy_scope(Line.where(line: @line))
    authorize(@line)
  end
end
