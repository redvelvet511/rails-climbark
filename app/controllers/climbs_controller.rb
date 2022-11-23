class ClimbsController < ApplicationController
  before_action :set_line, only: %i[new create]
  before_action :set_climb, only: %i[show edit update]

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
      render :new, status: 422
    end
  end

  def show
    authorize(@climb)
  end

  def edit
    authorize(@climb)
  end

  def update
    @climb.update(climb_params)
    authorize(@climb)
    
    if @climb.save
      redirect_to climb_path(@climb)
    else
      render :edit, status: 422
    end
  end

  private

  def set_line
    @line = Line.find(params[:line_id])
  end
  
  def set_climb
    @climb = Climb.find(params[:id])
  end

  def climb_params
    params.require(:climb).permit(:status, :description, :completion_date)
  end
end
