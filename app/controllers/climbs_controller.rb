class ClimbsController < ApplicationController
  before_action :set_line, only: %i[new create]

  def index
    @climbs = policy_scope(Climb)
  end

  def new
    @climb = Climb.new
    authorize(@climb)
  end

  def create
    @climb = Climb.new(climb_params)
    @climb.line = @line
    @climb.user = current_user
    authorize(@climb)

    if @climb.save
      redirect_to line_path(@line)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @climb = Climb.find(params[:id])
  end

  def update
    @climb = Climb.find(params[:id])
    @climb.update(climb_params)
    redirect_to climbs_path
    authorize @climb
  end

  private

  def set_line
    @line = Line.find(params[:line_id])
  end

  def climb_params
    params.require(:climb).permit(:status, :description, :completion_date)
  end
end
