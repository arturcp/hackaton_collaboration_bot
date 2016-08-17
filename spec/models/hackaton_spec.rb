require 'rails_helper'

describe Hackaton do
  let!(:hackaton) { create(:hackaton) }
  let!(:team) { create(:team, :gryffindor) }

  describe '#restart!' do
    let!(:team_point) { create(:team_point, team: team) }

    it 'clears the points from the database' do
      hackaton.restart!
      expect(TeamPoint.count).to eq(0)
    end
  end

  describe '#award_points' do
    context 'when the token is invalid' do
      before do
        expect_any_instance_of(Origin::Slack).to receive(:valid?).and_return(false)
      end

      it 'does not award points' do
        hackaton.award_points(team: team, token: '1234', points: 3)
        expect(TeamPoint.count).to eq(0)
      end
    end

    context 'when the token is valid' do
      before do
        expect_any_instance_of(Origin::Slack).to receive(:valid?).and_return(true)
      end

      it 'awards points to the team' do
        expect { hackaton.award_points(team: team, token: '12345', points: 3) }.to change { TeamPoint.sum('value') }.by(3)
      end
    end
  end
end
