class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search landing]

  def landing
  end

  def home
    @area1 = Area.near([46.469, -80.976], 140, order: :distance).first
    @area2 = Area.near([46.469, -80.976], 140, order: :distance).second
    @area3 = Area.near([46.469, -80.976], 140, order: :distance).third
  end
end
