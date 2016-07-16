require 'rails_helper'

describe Origin::Slack do
  describe '#valid?' do
    context 'test environment' do
      it 'is valid' do
        expect(described_class.new('12345678')).to be_valid
      end
    end

    context 'development environment' do
      let(:development) { double(production?: false) }

      it 'is valid' do
        allow(Rails).to receive(:env).and_return(development)
        expect(described_class.new('12345678')).to be_valid
      end
    end

    context 'production environment' do
      let(:production) { double(production?: true) }

      before do
        allow(Rails).to receive(:env).and_return(production)
        allow_any_instance_of(described_class).to receive(:token).and_return('12345678')
      end

      context 'when the token is valid' do
        it 'is valid' do
          origin = Origin::Slack.new('12345678')
          expect(origin).to be_valid
        end
      end

      context 'when the token is invalid' do
        it 'is not valid' do
          origin = Origin::Slack.new('999999999')
          expect(origin).not_to be_valid
        end
      end
    end
  end
end
