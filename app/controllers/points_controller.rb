class PointsController < ActionController::API
  include ActionController::Helpers
  helper DashboardHelper, SlackHelper

  def create
    @house_cup = house_cup

    if slack_message.valid?
      @house_cup.award_points(
        house: house,
        token: slack_params[:token],
        points: slack_message.points,
        user_name: slack_params[:user_name]
      )
    end
  end

  private

  def slack_message
    @slack_message ||= SlackMessage.new(
      message: slack_params[:text]
    )
  end

  def house
    @house ||= House.find_by_name(slack_message.house_name)
  end

  # TODO: The current house cup should be found by a url parameter
  def house_cup
    HouseCup.first
  end

  def slack_params
    params.permit(:token, :team_id, :team_domain, :channel_id, :channel_name,
      :timestamp, :user_id, :user_name, :text, :trigger_word)
  end
end
