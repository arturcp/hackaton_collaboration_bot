require 'rails_helper'

describe SlackHelper, type: :helper do
  describe '#success_response' do
    let(:hackaton) do
      create(
        :hackaton,
        success_text: '%{team_name} has now %{points} points! Check the house cup dashboard in %{dashboard_url}',
        error_text: ''
      )
    end

    before do
      allow(helper).to receive(:dashboard_url).and_return('http://www.hackaton.com')
    end

    it 'builds the success message' do
      expect(helper.success_response(hackaton, 'Gryffindor', 12))
        .to eq('Gryffindor has now 12 points! Check the house cup dashboard in http://www.hackaton.com')
    end
  end
end
