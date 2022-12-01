class ProfilesController < ApplicationController
  def show
    authorize(User, policy_class: ProfilePolicy)

    @climbs = policy_scope(Climb).order(climb_date: :desc)
    user_lines = current_user.lines.where("climbs.status = ?", "completed")
    highest_grade = Line.highest_grade(user_lines)
    @display_grade = highest_grade.nil? ? "—" : highest_grade
  end
end
