class ProfilesController < ApplicationController
  def show
    authorize(User, policy_class: ProfilePolicy)
    @recent_climbs = current_user.climbs.order(updated_at: :desc).limit(3)
  end
end
