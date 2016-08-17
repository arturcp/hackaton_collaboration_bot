class AdminController < ApplicationController
  def index
    @houses = House.all
    @points = @houses.reduce(0) { |sum, house| sum += house.points }
  end

  def destroy
    HouseCup.restart!
    redirect_to admin_path
  end
end
