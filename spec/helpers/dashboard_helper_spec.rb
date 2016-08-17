require 'rails_helper'

describe DashboardHelper, type: :helper do
  describe '#card_color' do
    it 'supports colors for 15 cards' do
      (0..14).each do |index|
        expect(helper.card_color(index)).not_to be_nil
      end
    end

    it 'uses a default color for indexes higher than 14' do
      expect(helper.card_color(15)).to eq('green')
    end
  end
end
