require 'rails_helper'

describe HouseCup do
  let!(:house_cup) { create(:house_cup) }
  let!(:house) { create(:house, :gryffindor) }

  describe '#restart!' do
    let!(:house_point) { create(:house_point, house: house) }

    it 'clears the points from the database' do
      house_cup.restart!
      expect(HousePoint.count).to eq(0)
    end
  end

  describe '#award_points' do
    context 'when the token is invalid' do
      before do
        expect_any_instance_of(Origin::Slack).to receive(:valid?).and_return(false)
      end

      it 'does not award points' do
        house_cup.award_points(house: house, token: '1234', points: 3)
        expect(HousePoint.count).to eq(0)
      end
    end

    context 'when the token is valid' do
      before do
        expect_any_instance_of(Origin::Slack).to receive(:valid?).and_return(true)
      end

      it 'awards points to the house' do
        expect { house_cup.award_points(house: house, token: '12345', points: 3) }.to change { HousePoint.sum('value') }.by(3)
      end
    end
  end

  describe '.find_by_name' do
    let!(:alias) { HouseAlias.first_or_create(alias: 'gryff', house: house) }

    context 'when the case matches' do
      it 'finds a house by name' do
        expect(House.find_by_name('Gryffindor')).to eq(house)
      end

      it 'finds a house by alias' do
        expect(House.find_by_name('gryff')).to eq(house)
      end

      it 'returns nil if no house was found' do
        expect(House.find_by_name('typo')).to be_nil
      end
    end

    context 'when the case does not match' do
      it 'finds a house by name' do
        expect(House.find_by_name('gryffindor')).to eq(house)
      end

      it 'finds a house by alias' do
        expect(House.find_by_name('Gryff')).to eq(house)
      end
    end
  end
end
