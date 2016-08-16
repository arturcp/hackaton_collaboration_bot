class House < ActiveRecord::Base
  has_many :house_points, dependent: :delete_all
  has_many :house_aliases, dependent: :destroy

  def points
    house_points.reduce(0) do |sum, house_point|
      sum += house_point.value
    end
  end

  def self.find_by_name(name)
    where('lower(name) = ?', name.downcase).first || find_by_alias(name)
  end

  private

  def self.find_by_alias(name)
    HouseAlias.where('lower(alias) = ?', name.downcase).first&.house
  end
end
