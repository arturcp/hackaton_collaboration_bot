class PointsController < ActionController::API
  def create
    @house = house_cup.house

    house_cup.award_points
  end

  private

  def house_cup
    HouseCup.new(message: slack_message)
  end

  def slack_message
    SlackMessage.new(
      token: slack_params[:token],
      user_name: slack_params[:user_name],
      message: slack_params[:text]
    )
  end

  def slack_params
    params.permit(:token, :team_id, :team_domain, :channel_id, :channel_name,
      :timestamp, :user_id, :user_name, :text, :trigger_word)
  end
end
