class DashboardController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @hackaton = Hackaton.first
    @teams = Team.all.sort_by { |team| [-team.points, team.name] }
  end
end
