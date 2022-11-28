class LinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @area = Area.find(params[:area_id])
    @lines = policy_scope(Line).where(area: @area)
    @suggested_lines = lines_suggested_for_user(current_user)
  end

  def show
    @line = Line.find(params[:id])
    authorize(@line)
    @tips = @line.tips
  end

  # def suggested_lines
  #   skip_authorization
  #   @area = Area.find(params[:area_id])
  #   @lines = @area.lines.where(grade: 5.10..5.12)
  #   # @lines = policy_scope(Line).where(area: @area)
  # end

  private

  def lines_suggested_for_user(user)
    user_lines = user.lines
    current_grade = Line.highest_grade(user_lines)
    next_grade = Line::GRADES_LIST[Line::GRADES_LIST.index(current_grade) + 1]

    suggested_lines = @lines.where(grade: current_grade).to_a
    suggested_lines.concat(@lines.where(grade: next_grade).to_a)
    suggested_lines
  end
end
