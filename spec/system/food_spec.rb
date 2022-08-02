require 'rails_helper'

RSpec.describe 'Food management function', type: :system do
  before do
    @user = User.create!( id:4, name: 'Invité(e)', email: "spfoodinvite@gmail.com", password: "invite12345", confirmed_at: DateTime.now )

    @admin_user = User.create!( id:1, name: 'Admin', email: "monadministrateur@gmail.com", password: "madmin1", confirmed_at: DateTime.now, admin: true )

    @restaurant = Restaurant.create!( id:1, name: 'mon restaurant', adress: 'cotonou', phone: '12345678' )

  end

    def user_login
      visit new_user_session_path
      find("#user_email").set("spfoodinvite@gmail.com")
      find("#user_password").set("invite12345")
      click_button "Se connecter"
    end

    def admin_user_login
      visit new_user_session_path
      find("#user_email").set('monadministrateur@gmail.com')
      find("#user_password").set('madmin1')
      click_button "Se connecter"
    end


  describe "Fonction de publication d'une nouvelle nourriture" do
      before do
        user_login
      end
      it "L'aliment créé est affiché" do

          visit "/foods/new"
        fill_in "food[name]", with: 'Riz au gras'
        fill_in "food[description]", with: "De chez nous"
        fill_in "food[price]", with: "2000"
        select 'mon restaurant'
          click_button 'Create Food'

          click_on 'Retourner'

          click_on 'Afficher'

       expect(page).to have_content 'Food'
      end
 end

#*******************************************************************************#

  describe "Fonction d'affichage détaillé" do
    before do
      user_login
    end
     context "Lorsque l'on passe à la modification de l'aliment en affichant l'écran de détails" do
       it "Possibilité d'éditer le contenu" do

            visit '/foods/new'
          fill_in "food[name]", with: 'Pate blanche'
          fill_in "food[description]", with: "Nouriture locale"
          fill_in "food[price]", with: "5000"
          select "mon restaurant"
            click_button 'Create Food'

            click_on 'Retourner'

            click_on 'Modifier'

            click_on 'Back'

        expect(page).to have_content 'Food'
       end
     end
  end

#*******************************************************************************#

    describe 'Fonction de suppression de contenue' do
      before do
        user_login
      end
       context "Lors de la transition vers l'écran de détails de l'aliment" do
         it "Possibilité de supprimer un contenue" do

              visit '/foods/new'
            fill_in "food[name]", with: 'Pate'
            fill_in "food[description]", with: "Locale"
            fill_in "food[price]", with: "2500"
            select "mon restaurant"
              click_button 'Create Food'

              click_on 'Retourner'

              click_on "Supprimer"
                a = page.driver.browser.switch_to.alert
                a.accept
            expect(page).to have_content 'Food'
         end
       end
    end

#*******************************************************************************#


  describe 'Fonction de commentaire de contenue' do
    before do
      user_login
    end
     context "Lors de la transition vers l'écran de détails pour commenter l'aliment" do
       it "Possibilité de créer un commentaire" do

            visit '/foods/new'
          fill_in "food[name]", with: 'Pate'
          fill_in "food[description]", with: "Locale"
          fill_in "food[price]", with: "2500"
          select "mon restaurant"
            click_button 'Create Food'

            click_on 'Retourner'

            click_on "Afficher"

            fill_in "comment[content]", with: 'Pate'

            click_on "Create Comment"
          expect(page).to have_content 'Food'
       end
     end
  end


end
