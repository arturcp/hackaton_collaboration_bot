class DashboardController < ApplicationController
  def index
    @houses = House.all.sort_by { |house| house.points }.reverse
  end
end
