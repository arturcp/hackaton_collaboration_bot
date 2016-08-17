require 'rails_helper'

describe 'Score points', type: :request do
  describe '#create' do
    context 'Slack webhook captures trigger keywords' do
      it 'concedes points to the specified house' do
        mock_success_response

        create(:house, :ravenclaw)
        post '/point', params: { text: '5 points to `Ravenclaw` because they helped me a lot' }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:text]).to include('Ravenclaw has now 5 points!')
        expect(json.count).to be_eql(1)
      end

      it 'alerts the user the message is invalid' do
        ENV['ERROR_RESPONSE'] = nil
        post '/point'

        json = JSON.parse(response.body, symbolize_names: true)
        message = 'Oops. Something is wrong =/'
        expect(json[:text]).to include(message)
      end
    end
  end
end

def mock_success_response
  allow(ENV).to receive(:fetch).with('SITE_URL').and_call_original
  allow(ENV).to receive(:fetch).with('SUCCESS_RESPONSE', '')
    .and_return('%{house_name} has now %{points} points! Check the house cup dashboard in %{dashboard_url}')
end
