class ClimbsController < ApplicationController
  def index
    @climbs = policy_scope(Climb)
  end

  def new
    @line = Line.find(params[:line_id])
    @climb = Climb.new
    authorize(@climb)
  end

  def create
    @line = Line.find(params[:line_id])
    @climb = Climb.new(climb_params)
    @climb.line = @line
    @climb.user = current_user
    authorize(@climb)

    if @climb.save
      redirect_to line_path(@line)
    else
      render :new, status: 422
    end
  end

  private

  def climb_params
    params.require(:climb).permit(:status, :description, :completion_date)
  end
end
