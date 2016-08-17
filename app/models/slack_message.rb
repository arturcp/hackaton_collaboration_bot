# Public: Represent the message written on slack that triggered the web hook
#
# For more information, consult https://rubyslackapi.slack.com/services/B1RQD447R?added=1
class SlackMessage
  POINTS_INDEX = 0

  attr_reader :points, :team_name, :user_name

  def initialize(message: '', user_name: '')
    @message = message
    @user_name = user_name

    extract_points!
    extract_name!
  end

  def valid?
    points > 0 && !team&.has_member?(@user_name)
  end

  def team
    @team ||= Team.find_by_name(@team_name)
  end

  private

  def extract_points!
    @points = @message.to_s.split(' ')[POINTS_INDEX].to_i
  end

  def extract_name!
    @team_name = /`[^`]+`/.match(@message).to_s.delete('`').capitalize
  end
end
