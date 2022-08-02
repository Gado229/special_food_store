require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'Enrégistrement de restaurant' do

    it "La validation marche" do
      restaurant = Restaurant.new(name: 'A', adress: 'AB', phone: 12345678)
      expect(restaurant).to be_valid
    end
    
  end
end
