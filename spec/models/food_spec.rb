require 'rails_helper'

RSpec.describe Food, type: :model do
  it "La validation ne marche pas" do
    food = Food.new(user_id:1, name: nil)
    expect(food).not_to be_valid
  end

  it "validation ne marche pas si l'identifiant de l'utilisateur est vide" do
    food = Food.new(user_id: nil , description: 'Le Benin est meilleur')
    expect(food).not_to be_valid
  end

  it 'La validation marche Si le nom et la description de la nouriture sont décrits' do

    @user = User.create!(email: "imoroug@nnn.co", password: "password", confirmed_at: DateTime.now)
    @restaurant = Restaurant.create!(name: 'BB', adress: 'cotonou', phone: '12345678')

    food = Food.new(user: @user, name: 'AA', description: 'De chez nous', restaurant: @restaurant)
    expect(food).to be_valid
  end

  it 'La validation est prise en défaut' do
    food = Food.new(user_id:1, name: 'Pate', description: '')
    expect(food).not_to be_valid
  end
end
