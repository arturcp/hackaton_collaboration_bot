require 'rails_helper'

describe 'Score points', type: :request do
  let!(:house_cup) { create(:house_cup) }

  describe '#create' do
    context 'Slack webhook captures trigger keywords' do
      it 'concedes points to the specified house' do
        create(:house, :ravenclaw)
        post '/point', params: { text: '5 points to `Ravenclaw` because they helped me a lot' }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:attachments][0][:pretext]).to include('Ravenclaw has now 5 points!')
        expect(json.count).to be_eql(1)
      end

      it 'alerts the user the message is invalid' do
        ENV['ERROR_RESPONSE'] = nil
        post '/point'

        json = JSON.parse(response.body, symbolize_names: true)
        message = 'Oops. Something is wrong =/'
        expect(json[:attachments][0][:pretext]).to include(message)
      end
    end
  end
end
