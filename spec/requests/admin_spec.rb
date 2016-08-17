require 'rails_helper'

describe 'Score points', type: :request do
  describe '#destroy' do
    it 'deletes all house points' do
      create(:house, :ravenclaw)
      gryffindor = create(:house, :gryffindor)
      create(:house_point, house: gryffindor)

      delete '/admin'

      expect(HousePoint.count).to eq(0)
      expect(response).to redirect_to(admin_path)
    end
  end
end
