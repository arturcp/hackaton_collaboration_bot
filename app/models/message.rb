# Public: Represent the message written on slack that triggered the webhook
#
# The Slack outgoing format for the text param is:
#   <botname>: <X> (point|points) to <house_name>...
#
# For more information, consult https://rubyslackapi.slack.com/services/B1RQD447R?added=1
class Message
  POINTS_INDEX = 1
  HOUSE_INDEX = 4

  attr_reader :points, :house_name

  def initialize(message = '')
    @message = message || ''
    @points = parts[POINTS_INDEX].to_i
    @house_name = parts[HOUSE_INDEX]&.capitalize || ''
  end

  def valid?
    points > 0 && house_name.present?
  end

  private

  def parts
    @parts ||= @message.split(' ')
  end
end
