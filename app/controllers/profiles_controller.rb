class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[show]
  def show
    authorize @profile, policy_class: ProfilePolicy
  end
end
