class Message
  attr_reader :points, :house_name

  def initialize(message)
    @message = message
    @points = parts.first.to_i
    @house_name = parts[3].capitalize
  end

  private

  def parts
    @parts ||= @message.split(' ')
  end
end
