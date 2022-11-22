class ClimbsController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create]
  def index
    @climbs = Climb.all
    authorize @climb, policy_class: ClimbPolicy
  end

  def new
    @climb = Climb.new
    authorize @climb, policy_class: ClimbPolicy
  end

  def create
    @line = Line.find(params[line_id])
    @climb.line = @line
    @climb = Climb.new(climb_params)
    @climb.user = current_user
    authorize @climb, policy_class: ClimbPolicy
    if @climb.save
      redirect_to climbs_path
    else
      render "climbs/new", status: 422
    end
  end

  private

  def climb_params
    params.require(climb).permit(:status, :description, :completion_date)
  end
end
