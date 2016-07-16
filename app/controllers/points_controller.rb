class PointsController < ActionController::API
  def create
    award_points
  end

  private

  def slack_params
    params.permit(:token, :team_id, :team_domain, :channel_id, :channel_name,
      :timestamp, :user_id, :user_name, :text, :trigger_word)
  end

  def current_house
    @house ||= House.find_by(name: message.house_name)
  end

  def message
    @message ||= Message.new(slack_params[:text])
  end

  def award_points
    return unless current_house

    HousePoint.create(
      house: current_house,
      value: message.points,
      user: slack_params[:user_name]
    )
  end
end
