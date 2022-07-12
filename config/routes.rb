Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy' 
    get "/users/sessions/:id/show", to: "users/sessions#show"
  end

  root "events#index"

  resources :events
  resources :events_attendings



  #get "/users/sessions/:id/show", to: "users/sessions#show"


end
