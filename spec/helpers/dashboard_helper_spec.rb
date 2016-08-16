require 'rails_helper'

describe DashboardHelper, type: :helper do
  describe '#card_color' do
    it 'supports colors for 15 cards' do
      (0..14).each do |index|
        expect(helper.card_color(index)).not_to be_nil
      end
    end

    it 'uses a default color for indexes higher than 14' do
      expect(helper.card_color(15)).to eq('green')
    end
  end

  describe '#success_response' do
    before do
      allow(helper).to receive(:dashboard_url).and_return('http://www.hackaton.com')
    end

    context 'when env variable is set' do
      it 'builds the success message' do
        allow(ENV).to receive(:fetch)
          .and_return('%{house_name} has now %{points} points! Check the house cup dashboard in %{dashboard_url}')
        expect(helper.success_response('Gryffindor', 12)).to eq('Gryffindor has now 12 points! Check the house cup dashboard in http://www.hackaton.com')
      end
    end

    context 'when env variable is not set' do
      it 'returns an empty string' do
        allow(ENV).to receive(:fetch).and_return('')
        expect(helper.success_response('Gryffindor', 12)).to be_empty
      end
    end
  end
end
