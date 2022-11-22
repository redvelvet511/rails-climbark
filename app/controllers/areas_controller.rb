class AreasController < ApplicationController
  def index
    @areas = Area.all
    @areas = policy_scope(Area)
  end
end
