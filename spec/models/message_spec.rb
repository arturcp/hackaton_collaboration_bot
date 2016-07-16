require 'rails_helper'

describe Message do
  describe '#points' do
    it 'awards points to a house' do
      (1..10).each do |point|
        expect(Message.new("#{point} point to somehouse").points).to eq(point)
      end
    end
  end

  describe '#house_name' do
    it 'extracts the name of the house' do
      expect(Message.new('1 point to Gryffindor').house_name).to eq('Gryffindor')
    end
  end
end
