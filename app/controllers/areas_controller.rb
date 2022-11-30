class AreasController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @areas = policy_scope(Area)
  end
end
