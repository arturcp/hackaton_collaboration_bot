class House < ActiveRecord::Base
  has_many :house_points, dependent: :delete_all

  def points
    house_points.reduce(0) do |sum, house_point|
      sum += house_point.value
    end
  end
end
