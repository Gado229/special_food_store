Rails.application.routes.draw do

  root 'foods#top'
  # get 'foods/top'

  resources :restaurants

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :users, only: [:show]

  resources :foods do
    resources :comments
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
