require 'rails_helper'

RSpec.describe Food, type: :model do
  # タイトルと製作年と上映時間と映倫区分があれば有効な状態であること
  it "validation does not pass if the Food title is empty" do
    food = Food.new(user_id: 4 , name: nil)
    expect(food).not_to be_valid
  end
  it "is valid with a name, description, price, image"
  # タイトルがなければ無効な状態であること
  it "is invalid without a name"
  # 重複したタイトルなら無効な状態であること
  it "is invalid with a duplicate name"
  # タイトルが101文字以上なら無効な状態であること
  it "is invalid with name is less than 1 character"
end
