class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch('ADMIN_USER'),
    password: ENV.fetch('ADMIN_PASSWORD') unless Rails.env.test?

  def index
    @houses = House.all
    @points = @houses.reduce(0) { |sum, house| sum += house.points }
  end

  def destroy
    HouseCup.restart!
    redirect_to admin_path
  end
end
