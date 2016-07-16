require 'rails_helper'

describe 'Score points', type: :request do
  context 'Slack webhook captures points trigger keywords' do
    it 'concedes points to the specified house' do
      post '/point', params: { house: 'ravenclaw' }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:uid]).to include('success!')
      expect(json.count).to be_eql(1)
    end
  end
end
