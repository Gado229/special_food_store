require 'rails_helper'

RSpec.describe 'Restaurant management function', type: :system do
  before do
    @user = User.create!( id:4, name: 'Invité(e)', email: "spfoodinvite@gmail.com", password: "invite12345", confirmed_at: DateTime.now )
    @restaurant = Restaurant.create!(name:'A',adress: 'AB', phone: 12345678, user_id:nil, id: 1)
  end

    def user_login
        visit new_user_session_path
      find("#user_email").set("spfoodinvite@gmail.com")
      find("#user_password").set("invite12345")
        click_button "Se connecter"
    end

  describe "Fonction de création Restaurant" do
    before do
      user_login
    end

    context 'Création de Restaurant' do

      it 'Restaurants sont affichés' do
        visit new_user_session_path
        expect(page).to have_content 'A'
      end
    end
  end

  describe do
    before do
      user_login
    end

    it "Possibilité de créer un nouveau restaurant" do
        visit foods_path

        click_button "Ajoutez un Restaurant"
      fill_in "restaurant[name]", with: 'A'
      fill_in "restaurant[adress]", with: 'AB'
      fill_in "restaurant[phone]", with: '12345678'
        click_on "Créer un(e) Restaurant"

        click_on "Retour"
          expect(page).to have_content 'restaurant'
    end
  end

  describe '' do
    before do
      user_login
    end

    it "Possibilité de créer un nouveau restaurant et aller a l'acceuil" do
        visit foods_path

        click_button "Ajoutez un Restaurant"
      fill_in "restaurant[name]", with: 'A'
      fill_in "restaurant[adress]", with: 'AB'
      fill_in "restaurant[phone]", with: '12345678'
        click_on "Créer un(e) Restaurant"

        click_on "Retour"

        click_on 'Acceuil'

          expect(page).to have_content 'Ma Page'
    end
  end

end
