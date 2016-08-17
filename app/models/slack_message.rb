# Public: Represent the message written on slack that triggered the web hook
#
# For more information, consult https://rubyslackapi.slack.com/services/B1RQD447R?added=1
class SlackMessage
  POINTS_INDEX = 0

  attr_reader :points, :team_name

  def initialize(message: '')
    @message = message || ''

    @points = parts[POINTS_INDEX].to_i

    extract_name!
  end

  def valid?
    points > 0 && team_name.present?
  end

  private

  def parts
    @parts ||= @message.split(' ')
  end

  def extract_name!
    @team_name = /`[^`]+`/.match(@message).to_s.delete('`').capitalize
  end
end
