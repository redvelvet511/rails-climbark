class TipsController < ApplicationController
  before_action :set_line, only: %i[new create]

  def new
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

  private

  def set_line
    @line = Line.find(params[:line_id])
  end

  def tip_params
    params.require(:tip).permit(:title, :content)
  end
end
