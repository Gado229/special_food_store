require 'rails_helper'

RSpec.describe Food, type: :model do

  describe 'Food model function', type: :model do
    describe 'Test de validation' do

      context "Si le nom de la nouriture est vide" do
        it "La validation ne marche pas" do
          food = Food.new(user_id:1, name:nil)
          expect(food).not_to be_valid
        end
      end

      context 'Si le nom et la description de la nouriture sont décrits' do
        it 'La validation marche' do
          food = Food.new(user_id:1, restaurant: @restaurant, name: 'Pate Blanche', description: 'Sauce tomate')
          expect(food).to be_valid
        end
      end

    end
  end

end
