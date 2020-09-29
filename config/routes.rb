Rails.application.routes.draw do
  #root route
  root to: redirect('/home', status:302)

  #homepage
  get 'home', to: 'static_pages#home', as: 'home'

  
  devise_for :users
    
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'users', to: 'users#index', as: 'users'

  
    

end
