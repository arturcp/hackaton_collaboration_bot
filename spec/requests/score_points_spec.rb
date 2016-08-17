require 'rails_helper'

describe 'Score points', type: :request do
  let!(:hackaton) { create(:hackaton) }
  let(:team) { create(:team, :ravenclaw) }
  let!(:team_member) { create(:team_member, team: team) }
  let(:data) { JSON.parse(response.body, symbolize_names: true)[:attachments][0] }

  describe '#create' do
    context 'when the message format is valid' do
      it 'concedes points to a specified team' do
        post '/point', params: {
          text: '5 points to `Ravenclaw` because they helped me a lot',
          user_name: 'Hermione' }

        expect(data[:pretext]).to include('Ravenclaw has now 5 points!')
        expect(data[:text]).to include('Go, Ravenclaw!')
      end
    end

    context 'when the team member is trying to give points to his/her own team' do
      it 'alerts the user the message is invalid' do
        post '/point', params: {
          text: '5 points to `Ravenclaw` because they helped me a lot',
          user_name: team_member.name }

        expect(data[:pretext]).to include('Oops. Something is wrong =/')
        expect(data[:text]).to include('It\'s better to call Dumbledore')
        expect(data[:image_url]).to include('http://cdn.collider.com/wp-content/uploads/2015/06/harry-potter-and-the-sorcerers-stone.jpg')
      end
    end

    context 'when the message format is invalid' do
      it 'alerts the user the message is invalid' do
        post '/point'

        expect(data[:pretext]).to include('Oops. Something is wrong =/')
        expect(data[:text]).to include('It\'s better to call Dumbledore')
        expect(data[:image_url]).to include('http://cdn.collider.com/wp-content/uploads/2015/06/harry-potter-and-the-sorcerers-stone.jpg')
      end
    end

    context 'when the team does not exist' do
      it 'alerts the user the message is invalid' do
        post '/point', params: {
          text: '5 points to `fake team`',
          user_name: 'Hermione' }

        expect(data[:pretext]).to include('Oops. Something is wrong =/')
        expect(data[:text]).to include('It\'s better to call Dumbledore')
        expect(data[:image_url]).to include('http://cdn.collider.com/wp-content/uploads/2015/06/harry-potter-and-the-sorcerers-stone.jpg')
      end
    end
  end
end
