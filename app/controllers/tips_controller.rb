class TipsController < ApplicationController
  before_action :set_line, only: %i[new create]
  before_action :set_tip, only: %i[edit update destroy]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def new
    # skip_authorization
    @tip = Tip.new
    authorize(@line, policy_class: TipPolicy)
  end

  def create
    @tip = Tip.new(tip_params)
    @tip.line = @line
    @tip.user = current_user
    authorize(@line, policy_class: TipPolicy)

    if @tip.save
      redirect_to line_path(@line)
    else
      render :new, status: 422
    end
  end

  def edit
    authorize(@tip)
  end

  def update
    authorize(@tip)

    if @tip.update(tip_params)
      redirect_to line_path(@tip.line)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize(@tip)

    @tip.destroy
    redirect_to line_path(@tip.line), status: :see_other
  end

  private

  def set_line
    @line = Line.find(params[:line_id])
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end

  def tip_params
    params.require(:tip).permit(:title, :content)
  end

  def user_not_authorized
    flash[:alert] = "You have to log a climb in order to leave a tip."
    redirect_to(line_path(@line))
  end
end
