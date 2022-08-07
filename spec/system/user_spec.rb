require 'rails_helper'
RSpec.describe 'User registration / login / logout function', type: :system do

  before do
  @user = User.create!(id:5, name: 'Invité(e)', email: "spfoodinvite@gmail.com", password: "invite12345", confirmed_at: DateTime.now)

  @admin_user = User.create!(id:1, name: 'Admin', email: "monadministrateur@gmail.com", password: "madmin1", confirmed_at: DateTime.now, admin: true)
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

#*****************************************************************************************
  describe 'User registration test' do
    context 'No user data and no login' do
      it "Test d'enregistrement d'un nouvel utilisateur" do
        visit new_user_registration_path
        click_on "S'inscrire"
        fill_in 'user[name]', with: 'Invite'
        fill_in 'user[email]', with: "spfood@gmail.com"
        fill_in 'user[password]', with: "12345678"
        click_on "S'inscrire"
        expect(page).to have_content 'Bienvenue ! Vous vous êtes bien enregistré(e).'
      end
      it "Un test qui saute à l'écran de connexion lorsque vous n'êtes pas connecté" do
        visit 'foods'
        click_on "Se connecter"
        expect(current_path).to eq new_user_session_path
      end
      it "ne devrait pas pouvoir accéder à l'écran de gestion" do
       visit new_user_session_path
       fill_in 'user[email]', with: 'userexample@gmail.com'
       fill_in 'user[password]', with: '00000000'
       click_button 'Se connecter'
       visit rails_admin_path
       expect(page).to_not have_content 'List Of Users'
      end
    end
  end

#******************************************************************************************

describe 'Session functionality testing' do
  before do
    user_login
   end

      it 'Pouvoir se connecter' do
        click_on 'Visiter'
        expect(current_path).to eq foods_path
      end


      it "Vous pouvez accéder à votre propre écran de détails" do
        click_on 'Ma Page'
        expect(current_path).to eq user_path(5)
      end


      it 'Pouvoir se déconnecter' do
        click_on 'Se déconnecter'
        expect(current_path).to eq root_path
      end
end

#*********************************************************************************************

  describe 'Administrators fonctionality' do
    before do
      admin_user_login
    end

      it "L'utilisateur général ne doit pas pouvoir accéder à l'écran de gestion" do
        visit rails_admin_path
        expect(page).to_not have_content 'Liste des Utilisateur'
      end

      it 'Administrators should be able to access the management screen' do
        click_on 'Admin'
        expect(current_path).to eq rails_admin_path
      end

      it 'The administrator should have access to the user\'s details screen' do
        visit "/users/5"
        expect(current_path).to eq user_path(5)
      end
  end

end
