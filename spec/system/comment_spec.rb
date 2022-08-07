require 'rails_helper'

RSpec.describe "Comment", type: :system do

  before do
    user =  FactoryBot.create(:user, name: 'Gado229',
                               email: 'imoroug@gmail.com',
                               password: 'azerty'
                               )
  restaurant = FactoryBot.create(:restaurant, name: 'mon restaurant', adress: 'cotonou', phone: '12345678' )
      visit new_user_session_path
        click_button 'Se connecter'
      fill_in 'user[email]', with: 'imoroug@gmail.com'
      fill_in 'user[password]', with: 'azerty'
      click_button 'Se connecter'
  end

#*******************************************************************************#

  describe 'New creation function' do
      context 'When creating a new comment' do
        it 'The created comment is displayed' do
          visit foods_path

          click_button 'Faire une publication'

        fill_in "food[name]", with: 'Riz au gras'
        fill_in "food[description]", with: "De chez nous"
        fill_in "food[price]", with: "2000"
        select 'mon restaurant'
          click_button 'Créer un(e) Food'

          click_on 'Retourner'

          click_on 'Afficher'

        fill_in "comment[content]", with: 'title test'

           click_on 'Créer un(e) Comment'

        fill_in "comment[content]", with: 'title test2'
           click_on 'Créer un(e) Comment'
         expect(page).to have_content 'title test2'
        end
      end
    end

#*******************************************************************************#

    describe 'New creation function' do
      context 'When creating a new comment' do
        it 'Editing The Created Comment' do
          visit foods_path

          click_button 'Faire une publication'

        fill_in "food[name]", with: 'Riz au gras'
        fill_in "food[description]", with: "De chez nous"
        fill_in "food[price]", with: "2000"
        select 'mon restaurant'
          click_button 'Créer un(e) Food'

          click_on 'Retourner'

          click_on 'Afficher'

        fill_in "comment[content]", with: 'title test23'

           click_on 'Créer un(e) Comment'

           click_on 'Modifier le commentaire'

        fill_in "comment[content]", with: 'test23'

           click_button 'Modifier ce(tte) Comment'

         expect(page).to have_content 'test23'

        end
      end
    end

#*******************************************************************************#

    describe 'New creation function' do
      context 'When creating a new comment' do
        it 'Deleting The Created Comment' do
          visit foods_path

          click_button 'Faire une publication'

        fill_in "food[name]", with: 'Riz au gras'
        fill_in "food[description]", with: "De chez nous"
        fill_in "food[price]", with: "2000"
        select 'mon restaurant'
          click_button 'Créer un(e) Food'

          click_on 'Retourner'

          click_on 'Afficher'

        fill_in "comment[content]", with: 'title test23'

           click_on 'Créer un(e) Comment'

           click_on 'Supprimer'

           a = page.driver.browser.switch_to.alert
           a.accept

         expect(page).to have_content 'comment'

        end
      end
    end

end
