class DashboardController < ApplicationController
  def index
    @houses = House.all
  end
end
