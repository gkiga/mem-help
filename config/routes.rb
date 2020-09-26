Rails.application.routes.draw do
  
  #homepage
  get 'home', to: 'static_pages#home', as: 'home'

  
  devise_for :users
    
    

end
