class DashboardController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @houses = House.all.sort_by { |house| house.points }.reverse
  end

  def destroy
    HouseCup.restart!
  end
end
