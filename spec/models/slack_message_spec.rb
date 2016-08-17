require 'rails_helper'

describe SlackMessage do
  describe '#points' do
    context 'when the message is valid' do
      it 'awards points to a team' do
        (1..10).each do |point|
          message = described_class.new(message: "#{point} point to a team")
          expect(message.points).to eq(point)
        end
      end
    end

    context 'when the message is invalid' do
      it { expect(subject.points).to eq(0) }
    end
  end

  describe '#team_name' do
    context 'when the message is valid' do
      it 'extracts the name of the team' do
        expect(described_class.new(message: '1 point to `Gryffindor`').team_name).to eq('Gryffindor')
      end

      it 'capitalizes the name of the team' do
        expect(described_class.new(message: '1 point to `gryffindor`').team_name).to eq('Gryffindor')
      end
    end

    context 'when the message is invalid' do
      it { expect(subject.team_name).to be_empty }
    end
  end

  describe '#valid?' do
    context 'when no points were awarded' do
      subject { described_class.new(message: '0 points to `team`') }

      it { is_expected.not_to be_valid }
    end

    context 'when no team was specified' do
      subject { described_class.new(message: '0 points') }

      it { is_expected.not_to be_valid }
    end

    context 'when the team member is trying to give points to his/her own team' do
      let(:team) { create(:team, :gryffindor) }
      let!(:team_member) { create(:team_member, team: team) }
      subject { described_class.new(message: '2 points to `Gryffindor`', user_name: 'Harry') }

      it { is_expected.not_to be_valid }
    end

    context 'when points and team were provided correctly' do
      subject { described_class.new(message: '10 points to `Ravenclaw`') }

      it { is_expected.to be_valid }
    end
  end

  describe '#team' do
    context 'when the team does not exist' do
      subject { described_class.new(message: '2 points to `someone`') }

      it { expect(subject.team).to be_nil }
    end

    context 'when the team is not provided' do
      it { expect(subject.team).to be_nil }
    end

    context 'when the team is valid' do
      let!(:team) { create(:team, :gryffindor) }
      subject { described_class.new(message: '2 points to `Gryffindor`') }

      it { expect(subject.team).to eq(team) }
    end
  end
end
