class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch('ADMIN_USER'),
    password: ENV.fetch('ADMIN_PASSWORD') unless Rails.env.test?

  def index
    @hackaton = hackaton
    @teams = Team.all
    @team_members = TeamMember.all
    @points = TeamPoint.all
    @points_to_audit = points_to_examine
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

  def points_to_examine
    names = @team_members.map(&:name)
    @points.select { |point| names.exclude?(point.user) }
  end
end
