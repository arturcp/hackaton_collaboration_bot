class Hackaton < ActiveRecord::Base
  def award_points(team:, token: '', points: 0, user_name: '', origin: Origin::Slack)
    return unless origin.new(token).valid? && team

    TeamPoint.create(
      team: team,
      value: points,
      user: user_name
    )
  end

  def restart!
    TeamPoint.delete_all
    touch
  end
end
