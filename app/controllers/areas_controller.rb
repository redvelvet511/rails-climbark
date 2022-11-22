class AreasController < ApplicationController
  def index
    @areas = policy_scope(Area)
  end
end
