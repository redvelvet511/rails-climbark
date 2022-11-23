class ProfilesController < ApplicationController
  def show
    authorize(User, policy_class: ProfilePolicy)
  end
end
