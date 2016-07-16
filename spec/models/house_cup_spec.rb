require 'rails_helper'

describe HouseCup do
  let!(:house) { create(:house, :gryffindor) }

  describe '.restart!' do
    let!(:house_point) { create(:house_point, house: house) }

    it 'clears the points from the database' do
      HouseCup.restart!
      expect(HousePoint.count).to eq(0)
    end
  end

  describe '.award_points' do
    context 'when the token is invalid' do
      before do
        expect_any_instance_of(Origin::Slack).to receive(:valid?).and_return(false)
      end

      it 'does not award points' do
        HouseCup.award_points(house: house, token: '1234', points: 3)
        expect(HousePoint.count).to eq(0)
      end
    end

    context 'when the token is valid' do
      before do
        expect_any_instance_of(Origin::Slack).to receive(:valid?).and_return(true)
      end

      it 'awards points to the house' do
        expect { HouseCup.award_points(house: house, token: '12345', points: 3) }.to change { HousePoint.sum('value') }.by(3)
      end
    end
  end
end
