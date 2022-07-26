require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food model function', type: :model do
    describe 'Validation test' do
      context "If the food name is empty" do
        it "It's hard to Validation" do
          food = Food.new(name: '', description: 'Failure test', price: 123)
          expect(food).not_to be_valid
        end
      end
      context 'If the food name and description are described' do
        it 'Validation passes' do
          food = Food.new(name: 'Tu', description: 'Failure test', price: 123)
          expect(food).to be_valid # Write content here
        end
      end
      context "If the food details are empty" do
        it 'Validation is caught' do
          food = Food.new(name: 'Piron', description: '', price: 123)
          expect(food).not_to be_valid # Write content here
        end
      end
    end
  end
  # タイトルと製作年と上映時間と映倫区分があれば有効な状態であること
  it "validation does not pass if the Food title is empty" do
    food = Food.new(user_id: 4 , name: nil)
    expect(food).not_to be_valid
  end
  it 'validation does not pass if the user_id is nil' do
    food = Food.new(user_id: nil , name: 'Pâte de maïs')
    expect(food).not_to be_valid
  end
  # it "is valid with a name, description, price, image"
  #   food = Food.new(user_id: 4 , name: nil)
  #   expect(food).not_to be_valid
  # end
  it "is invalid without a name"
  # 重複したタイトルなら無効な状態であること
  it "is invalid with a duplicate name"
  # タイトルが101文字以上なら無効な状態であること
  it "is invalid with name is less than 1 character"
end
