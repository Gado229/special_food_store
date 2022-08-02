require 'rails_helper'

RSpec.describe User, type: :model do

  describe "User Registration" do

    context "Registration without one attributes " do
      it "Does not pass without email" do
        user = User.new(name: 'Gado1', email: nil, password: "password")
        expect(user).not_to be_valid
      end

      it "Does not pass without password" do
        user = User.new(name: 'Gado2', email: "gado2@gmail.com", password: nil)
        expect(user).not_to be_valid
      end

      it "Does not pass without name" do
        user = User.new(name: nil, email: "gado3gmail.com", password: 'password')
        expect(user).not_to be_valid
      end

      it "Does not pass with false email" do
        user = User.new(name: 'Gado4', email: "gado4mail.co", password: 'password')
        expect(user).not_to be_valid
      end
    end

    context "Ragistrations pass" do
      it "register user with all neccessaries informations" do
        user = User.new(name: 'Gado229', email: "imoroug@gmail.com", password: "password")
        expect(user).to be_valid
      end
    end

  end
  
end
