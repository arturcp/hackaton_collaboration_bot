class PointsController < ActionController::API
  include ActionController::Helpers
  helper DashboardHelper

  def create
    @hackaton = hackaton

    if slack_message.valid?
      @team = slack_message.team

      @hackaton.award_points(
        team: slack_message.team,
        token: slack_params[:token],
        points: slack_message.points,
        user_name: slack_message.user_name
      )
    end
  end

  private

  def slack_message
    @slack_message ||= SlackMessage.new(
      message: slack_params[:text],
      user_name: slack_params[:user_name]
    )
  end

  # TODO: The current hackaton should be found by a url parameter
  def hackaton
    Hackaton.first
  end

  def slack_params
    params.permit(:token, :team_id, :team_domain, :channel_id, :channel_name,
      :timestamp, :user_id, :user_name, :text, :trigger_word)
  end
end
