class HouseCup
  def self.award_points(house:, token: '', points: 0, user_name: '', origin: Origin::Slack)
    return unless origin.new(token).valid? && house

    HousePoint.create(
      house: house,
      value: points,
      user: user_name
    )
  end

  def self.start!
    HousePoint.delete_all
  end
end
