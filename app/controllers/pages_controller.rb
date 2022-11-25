class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search landing]

  def landing
  end

  def home
  end
end
