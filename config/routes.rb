Rails.application.routes.draw do
  resources :reviews
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


# globals
get 'globals', to: 'globals#index', as: 'globals' # index
get 'globals/new', to: 'globals#new', as: 'new_global' # new
post 'globals', to: 'globals#create' # create
get 'globals/:id', to: 'globals#show', as: 'global' # show
get 'globals/:id/edit', to: 'globals#edit', as: 'edit_global' # edit
patch 'globals/:id', to: 'globals#update' # update (as needed)
put 'globals/:id', to: 'globals#update' # update (full replacement)
delete 'globals/:id', to: 'globals#destroy' # destroy


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
    
  # follows
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  get 'account/follows', to: 'account_follows#index', as: 'account_follows' # my follows page



end
