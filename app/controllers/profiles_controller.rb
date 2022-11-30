class ProfilesController < ApplicationController
  def show
    authorize(User, policy_class: ProfilePolicy)
    @climbs = current_user.climbs.order(updated_at: :desc)
  end
end
