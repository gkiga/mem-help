Rails.application.routes.draw do
  devise_for :users
  #root route
  root to: redirect('/home', status:302)

  #homepage
  get 'home', to: 'static_pages#home', as: 'home'

  get 'requests', to: 'requests#index', as: 'requests' # index
  get 'requests/new', to: 'requests#new', as: 'new_request' # new
  post 'requests', to: 'requests#create' # create
  get 'requests/:id', to: 'requests#show', as: 'request' # show
  get 'requests/:id/edit', to: 'requests#edit', as: 'edit_request' # edit
  patch 'requests/:id', to: 'requests#update' # update (as needed)
  put 'requests/:id', to: 'requests#update' # update (full replacement)
  delete 'requests/:id', to: 'requests#destroy' # destroy



    
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'users', to: 'users#index', as: 'users'

  
    

end
