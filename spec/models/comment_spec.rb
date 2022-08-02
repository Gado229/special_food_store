require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "Comment validations" do
    it "Does not pass if food_id is null" do
      comment = Comment.new(food_id: nil, content:'hello')
      expect(comment).not_to be_valid
    end
  end

#*******************************************************************************#
#
#   describe "Comment validations" do
#     # before do
#     #   @user = User.create!(email: "hello123@user.co", password: "password", confirmed_at: DateTime.now)
#     #   @restaurant = Restaurant.create!(name: 'BB', adress: 'cotonou', phone: '12345678')
#     #   # @food = Food.create!(content: 'test', user_id: @user)
#     #   @food = Food.create!(user: @user, name: 'AA', description: 'De chez nous', restaurant: @restaurant)
#     # end
#     it "Does pass if food_id is not null" do
# @user = User.create!(email: "imoroug@gmail.com", password: "azerty", confirmed_at: DateTime.now)
#
# @restaurant = Restaurant.create(name: 'A', adress: 'AB', phone: '12345678')
#
# @food = Food.create!(user: @user_id, name: 'AA', description: 'De chez nous', restaurant: @restaurant)
#
#       comment = Comment.new(user_id: @user_id, food_id: @food_id, content: 'hello world')
#       expect(comment).to be_valid
#     end
#   end

end
