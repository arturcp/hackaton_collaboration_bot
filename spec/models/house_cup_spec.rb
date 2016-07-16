require 'rails_helper'

describe HouseCup do
  let!(:house) { create(:house, :gryffindor) }

  describe '.start' do
    let!(:house_point) { create(:house_point, house: house) }

    it 'clears the points from the database' do
      HouseCup.start!
      expect(HousePoint.count).to eq(0)
    end
  end

  describe '#award_points' do
    let(:message) { SlackMessage.new(message: 'hogwarts_bot: 3 points to Gryffindor') }
    let(:house_cup) { HouseCup.new(message: message, origin: Origin::Slack) }

    context 'when the token is invalid' do
      before do
        expect_any_instance_of(Origin::Slack).to receive(:valid?).and_return(false)
      end

      it 'does not award points' do
        house_cup.award_points
        expect(HousePoint.count).to eq(0)
      end
    end

    context 'when the token is valid' do
      before do
        expect_any_instance_of(Origin::Slack).to receive(:valid?).and_return(true)
      end

      it 'awards points to the house' do
        expect { house_cup.award_points }.to change { HousePoint.sum('value') }.by(3)
      end
    end
  end
end
