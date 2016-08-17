require 'rails_helper'

describe SlackHelper, type: :helper do
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
