class ProfilesController < ApplicationController
  def show
    authorize @profile, policy_class: ProfilePolicy
  end
end
