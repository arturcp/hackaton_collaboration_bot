require 'rails_helper'

describe SlackMessage do
  describe '#points' do
    context 'when the message is valid' do
      it 'awards points to a house' do
        (1..10).each do |point|
          message = SlackMessage.new(message: "#{point} point to somehouse")
          expect(message.points).to eq(point)
        end
      end
    end

    context 'when the message is invalid' do
      it 'does not award any house points' do
        expect(SlackMessage.new.points).to eq(0)
      end
    end
  end

  describe '#house_name' do
    context 'when the message is valid' do
      it 'extracts the name of the house' do
        expect(SlackMessage.new(message: '1 point to `Gryffindor`').house_name).to eq('Gryffindor')
      end

      it 'capitalizes the name of the house' do
        expect(SlackMessage.new(message: '1 point to `gryffindor`').house_name).to eq('Gryffindor')
      end
    end

    context 'when the message is invalid' do
      it 'returns a blank string' do
        expect(SlackMessage.new.house_name).to be_empty
      end
    end
  end

  describe '#valid?' do
    context 'when no points were awarded' do
      it 'is invalid' do
        expect(SlackMessage.new(message: '0 points to `house`')).not_to be_valid
      end
    end

    context 'when no house was specified' do
      it 'is invalid' do
        expect(SlackMessage.new(message: '0 points')).not_to be_valid
      end
    end

    context 'when points and houses were provided' do
      it 'is valid' do
        expect(SlackMessage.new(message: '10 points to `Ravenclaw`')).to be_valid
      end
    end
  end
end
