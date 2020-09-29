Rails.application.routes.draw do
  #root route
  root to: redirect('/home', status:302)

  #homepage
  get 'home', to: 'static_pages#home', as: 'home'

  
  devise_for :users
    
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  #Profile Page
  get 'users/:id', to: 'users#show', as: 'user'

  get 'profile', to: 'static_pages#profile', as: 'profile'
  get 'users', to: 'users#index', as: 'users'

  
    

end
