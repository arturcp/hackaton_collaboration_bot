class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch('ADMIN_USER'),
    password: ENV.fetch('ADMIN_PASSWORD') unless Rails.env.test?

  def index
    @hackaton = hackaton
    @teams = Team.all
    @points = @teams.reduce(0) { |sum, team| sum += team.points }
  end

  def destroy
    hackaton.restart!
    redirect_to admin_path
  end

  private

  # TODO: The current hackaton should be found by a url parameter
  def hackaton
    Hackaton.first
  end
end
