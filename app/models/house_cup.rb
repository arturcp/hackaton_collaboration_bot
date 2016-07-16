class HouseCup
  attr_reader :message, :user_name, :house

  def initialize(token:, user_name:, message:, origin: Origin::Slack)
    @message = Message.new(message)
    @origin = origin.new(token)
    @user_name = user_name
    @house = current_house
  end

  def award_points
    return unless @origin.valid? && current_house

    HousePoint.create(
      house: current_house,
      value: message.points,
      user: user_name
    )
  end

  def self.start!
    HousePoint.delete_all
  end

  private

  def current_house
    @house ||= House.find_by(name: message.house_name)
  end
end
