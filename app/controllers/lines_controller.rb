class LinesController < ApplicationController
  def index
    @area = Area.find(params[:area_id])
    # @lines.area = @area
    @lines = Line.all
    @lines = policy_scope(Line)
  end
end
