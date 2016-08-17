class DashboardController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @houses = House.all.sort_by { |house| [-house.points, house.name] }
  end
end
