# Public: Represent the message written on slack that triggered the web hook
#
# The Slack outgoing format for the text param is:
#   <botname>: <X> (point|points) to <house_name>...
#
# For more information, consult https://rubyslackapi.slack.com/services/B1RQD447R?added=1
class SlackMessage
  POINTS_INDEX = 0

  attr_reader :points, :house_name

  def initialize(message: '')
    @message = message || ''

    @points = parts[POINTS_INDEX].to_i

    extract_name!
  end

  def valid?
    points > 0 && house_name.present?
  end

  private

  def parts
    @parts ||= @message.split(' ')
  end

  def extract_name!
    @house_name = /`[^`]+`/.match(@message).to_s.delete('`').capitalize
  end
end
