Rails.application.routes.draw do
  devise_for :users
  #root route
  root to: redirect('/home', status:302)

  #homepage
  get 'home', to: 'static_pages#home', as: 'home'

  # requests
  get 'requests', to: 'requests#index', as: 'requests' # index
  get 'requests/new', to: 'requests#new', as: 'new_request' # new
  post 'requests', to: 'requests#create' # create
  get 'requests/:id', to: 'requests#show', as: 'request' # show
  get 'requests/:id/edit', to: 'requests#edit', as: 'edit_request' # edit
  patch 'requests/:id', to: 'requests#update' # update (as needed)
  put 'requests/:id', to: 'requests#update' # update (full replacement)
  delete 'requests/:id', to: 'requests#destroy' # destroy

  # messages
  get 'messages', to: 'messages#index', as: 'messages' # index
  get 'messages/new', to: 'messages#new', as: 'new_message' # new
  post 'messages', to: 'messages#create' # create
  get 'messages/:id', to: 'messages#show', as: 'message' # show
  get 'messages/:id/edit', to: 'messages#edit', as: 'edit_message' # edit
  patch 'messages/:id', to: 'messages#update' # update (as needed)
  put 'messages/:id', to: 'messages#update' # update (full replacement)
  delete 'messages/:id', to: 'messages#destroy' # destroy


  # users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'users/:id', to: 'users#show', as: 'user'

  get 'profile', to: 'static_pages#profile', as: 'profile'
  get 'users', to: 'users#index', as: 'users'
  #get "/users/id", to: "static_pages#profile"
  

  # videos
  get 'account/videos', to: 'account_videos#index', as: 'account_videos' # index

  get 'account/videos/new', to: 'account_videos#new', as: 'new_account_video' # new
  post 'account/videos', to: 'account_videos#create' # create

  get '/videos/:id', to: 'videos#show', as: 'video' # show

  get 'videos/:id/edit', to: 'videos#edit', as: 'edit_video' #edit
  patch 'videos/:id', to: 'videos#update' # update
  put 'videos/:id', to: 'videos#update' # update

  delete 'videos/:id', to: 'videos#destroy' # delete


  #my_notifications
  resources :my_notifications do
    collection do 
      post :mark_as_read
    end
  end

  delete "my_notifications/:id", to: "my_notifications#destroy"  # delete
    

end
