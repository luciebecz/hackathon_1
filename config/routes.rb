Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {
    registration: 'users/registrations'
  }

  # get 'dogs/new', to: 'dogs#new', as: 'new_dog'

  get 'all_dogs', to: 'dogs#all_dogs'
  
  resources :dogs do 
    resources :playdates 
  end 
  
end
