class Team < ActiveRecord::Base
  has_many :team_points, dependent: :destroy
  has_many :team_aliases, dependent: :destroy
  has_many :team_members, dependent: :destroy

  def points
    team_points.reduce(0) do |sum, team_point|
      sum += team_point.value
    end
  end

  def self.find_by_name(name)
    where('lower(name) = ?', name.downcase).first || find_by_alias(name)
  end

  def has_member?(name)
    team_members.find { |team_member| team_member.name == name }.present?
  end

  private

  def self.find_by_alias(name)
    TeamAlias.where('lower(alias) = ?', name.downcase).first&.team
  end
end
