class HouseCup < ActiveRecord::Base
  def award_points(house:, token: '', points: 0, user_name: '', origin: Origin::Slack)
    return unless origin.new(token).valid? && house

    HousePoint.create(
      house: house,
      value: points,
      user: user_name
    )
  end

  def restart!
    HousePoint.delete_all
    touch
  end
end
