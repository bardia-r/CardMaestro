Rails.application.routes.draw do
  resources :messages
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/tos'
  get 'welcome/privacy_policy'  
  get 'welcome/help'
  get 'welcome/faq' 
  get 'welcome/sitemap'     
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  
  get 'cards/admin'
  resources :cards do
    get :approve
  end
  
  post 'messages/check'
  resources :messages do
    get :check
  end

  post 'messages/chat'
  resources :messages do
    get :chat
  end
  post 'messages/new-contacts'
  resources :messages do
    get :new_contacts
  end

  resources :card_ownerships

  #resources :collections

  get '/users/personalcards/index'
  get '/users/personalcards/new'
  get '/users/personalcards/:username', to: 'users/personalcards#show',  as: 'users_personalcards_username'
  
  root 'welcome#index'
  #root to: redirect("/users/sign_in")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
