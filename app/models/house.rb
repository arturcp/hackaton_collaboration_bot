class House < ActiveRecord::Base
  has_many :house_points

  def points
    house_points.reduce(0) do |sum, house_point|
      sum += house_point.value
    end
  end
end
