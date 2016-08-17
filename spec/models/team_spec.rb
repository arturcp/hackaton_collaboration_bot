require 'rails_helper'

describe Team do
  let!(:team) { create(:team, :gryffindor) }

  describe '.find_by_name' do
    let!(:alias) { TeamAlias.first_or_create(alias: 'gryff', team: team) }

    context 'when the case matches' do
      it 'finds a team by name' do
        expect(described_class.find_by_name('Gryffindor')).to eq(team)
      end

      it 'finds a team by alias' do
        expect(described_class.find_by_name('gryff')).to eq(team)
      end

      it 'returns nil if no team was found' do
        expect(described_class.find_by_name('typo')).to be_nil
      end
    end

    context 'when the case does not match' do
      it 'finds a team by name' do
        expect(described_class.find_by_name('gryffindor')).to eq(team)
      end

      it 'finds a team by alias' do
        expect(described_class.find_by_name('Gryff')).to eq(team)
      end
    end
  end

  describe '#has_member?' do
    let!(:team_member) { create(:team_member, team: team) }
    it 'returns true if user is a team member' do
      expect(team.has_member?('Harry')).to be true
    end

    it 'returns false if user is not a team member' do
      expect(team.has_member?('Rony')).to be false
    end
  end
end
