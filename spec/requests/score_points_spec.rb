require 'rails_helper'

describe 'Score points', type: :request do
  describe '#create' do
    context 'Slack webhook captures trigger keywords' do
      it 'concedes points to the specified house' do
        create(:house, :ravenclaw)
        post '/point', params: { text: '5 points to `Ravenclaw` because they helped me a lot' }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:text]).to include('Ravenclaw has now 5 points!')
        expect(json.count).to be_eql(1)
      end

      it 'alerts the user the message is invalid' do
        post '/point'

        json = JSON.parse(response.body, symbolize_names: true)
        message = 'Oops. Something is wrong =/'
        expect(json[:text]).to include(message)
      end
    end
  end

  describe '#destroy' do
    it 'deletes all house points' do
      create(:house, :ravenclaw)
      gryffindor = create(:house, :gryffindor)
      create(:house_point, house: gryffindor)

      delete '/dashboard'

      expect(HousePoint.count).to eq(0)
    end
  end
end
