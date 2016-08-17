class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch('ADMIN_USER'),
    password: ENV.fetch('ADMIN_PASSWORD') unless Rails.env.test?

  def index
    @house_cup = house_cup
    @houses = House.all
    @points = @houses.reduce(0) { |sum, house| sum += house.points }
  end

  def destroy
    house_cup.restart!
    redirect_to admin_path
  end

  private

  # TODO: The current house cup should be found by a url parameter
  def house_cup
    HouseCup.first
  end
end
