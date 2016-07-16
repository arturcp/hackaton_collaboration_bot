class PointsController < ActionController::API
  def create
    if slack_message.valid?
      HouseCup.award_points(
        house: house,
        token: slack_params[:token],
        points: slack_message.points,
        user_name: slack_params[:user_name]
      )
    end
  end

  def destroy
    HouseCup.restart!
  end

  private

  def slack_message
    @slack_message ||= SlackMessage.new(
      message: slack_params[:text]
    )
  end

  def house
    @house ||= House.find_by(name: slack_message.house_name)
  end

  def slack_params
    params.permit(:token, :team_id, :team_domain, :channel_id, :channel_name,
      :timestamp, :user_id, :user_name, :text, :trigger_word)
  end
end
