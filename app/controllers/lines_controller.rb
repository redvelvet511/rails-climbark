class LinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @area = Area.find(params[:area_id])
    @lines = policy_scope(Line).where(area: @area)
  end

  def show
    @line = Line.find(params[:id])
    authorize(@line)
    @tips = @line.tips
  end

  def suggested_lines
    skip_authorization
    @area = Area.find(params[:area_id])
    @lines = @area.lines.where(grade: 5.10..5.12)
    # @lines = policy_scope(Line).where(area: @area)
  end
end
