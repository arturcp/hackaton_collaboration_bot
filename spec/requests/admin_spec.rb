require 'rails_helper'

describe 'Score points', type: :request do
  describe '#destroy' do
    it 'deletes all team points' do
      create(:hackaton)
      create(:team, :ravenclaw)
      gryffindor = create(:team, :gryffindor)
      create(:team_point, team: gryffindor)

      delete '/admin'

      expect(TeamPoint.count).to eq(0)
      expect(response).to redirect_to(admin_path)
    end
  end
end
