require 'rails_helper'

describe 'Score points', type: :request do
  let!(:hackaton) { create(:hackaton) }

  describe '#create' do
    context 'Slack webhook captures trigger keywords' do
      it 'concedes points to a specified team' do
        create(:team, :ravenclaw)
        post '/point', params: { text: '5 points to `Ravenclaw` because they helped me a lot' }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:attachments][0][:pretext]).to include('Ravenclaw has now 5 points!')
        expect(json[:attachments][0][:text]).to include('Go, Ravenclaw!')
        expect(json.count).to be_eql(1)
      end

      it 'alerts the user the message is invalid' do
        ENV['ERROR_RESPONSE'] = nil
        post '/point'

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:attachments][0][:pretext]).to include('Oops. Something is wrong =/')
        expect(json[:attachments][0][:text]).to include('It\'s better to call Dumbledore')
        expect(json[:attachments][0][:image_url]).to include('http://cdn.collider.com/wp-content/uploads/2015/06/harry-potter-and-the-sorcerers-stone.jpg')
      end
    end
  end
end
