class LinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_area, only: %i[index suggested_lines]

  def index
    @lines = policy_scope(Line).where(area: @area)

    respond_to do |format|
      format.html
      format.text { render partial: "lines_list", locals: { lines: @lines }, formats: [:html] }
    end
  end

  def suggested_lines
    @lines = policy_scope(Line).where(area: @area)
    @suggested_lines = lines_suggested_for_user(current_user)

    respond_to do |format|
      format.html
      format.text { render partial: "lines_list", locals: { lines: @suggested_lines }, formats: [:html] }
    end

    skip_authorization
  end

  def show
    @line = Line.find(params[:id])
    authorize(@line)
    @tips = @line.tips
  end

  private

  def set_area
    @area = Area.find(params[:area_id])
  end

  def lines_suggested_for_user(user)
    user_lines = user.lines.where("climbs.status = ?", "completed")
    current_grade = Line.highest_grade(user_lines)
    next_grade = Line::GRADES_LIST[Line::GRADES_LIST.index(current_grade) + 1]

    suggested_lines = @lines.where(grade: current_grade).where.not(id: user_lines).to_a
    suggested_lines.concat(@lines.where(grade: next_grade).to_a)
    suggested_lines
  end
end
