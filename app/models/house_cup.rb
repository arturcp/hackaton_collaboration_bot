class HouseCup
  attr_reader :message, :user_name, :house

  # TODO: these parameters should go to the awards method
  def initialize(message:, origin: Origin::Slack)
    @origin = origin.new(message.token)
    @message = message
    @house = current_house
  end

  def award_points
    return unless @origin.valid? && current_house

    HousePoint.create(
      house: @house,
      value: message.points,
      user: message.user_name
    )
  end

  def self.start!
    HousePoint.delete_all
  end

  private

  def current_house
    House.find_by(name: message.house_name)
  end
end
