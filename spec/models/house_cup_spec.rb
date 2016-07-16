require 'rails_helper'

describe HouseCup do
  describe '.start' do
    let(:house) { create(:house, :gryffindor) }
    let!(:house_point) { create(:house_point, house: house) }

    it 'clears the points from the database' do
      HouseCup.start!
      expect(HousePoint.count).to eq(0)
    end
  end
end
