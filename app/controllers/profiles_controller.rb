class ProfilesController < ApplicationController
  def show
    @user = current_user
    authorize(@user, policy_class: ProfilePolicy)
  end
end
