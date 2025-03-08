Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # Devise handles user authentication, registration, and session management
  devise_for :users, controllers: { registrations: "devise_registrations" }

  # Home feed (posts from friends)
  root to: redirect('/home')
  get 'home', to: 'home#index'

  # Profile (for your own profile management)
  resource :profile, only: [:show, :edit, :update]

  # Friends (full profiles for friends + friends list)
  resources :friends, only: [:index, :show]

  # Posts (comments & likes nested inside posts)
  resources :posts, only: [:create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :like, only: [:create, :destroy]
  end
  get "publish", to: "posts#new", as: "new_post"

  # Invite management (generating your invite link, viewing invites)
  resource :invite, only: [:create]
  get 'invite/:token', to: 'invites#show', as: 'view_invite'

  # Friendships (accepting invite links lands here)
  resources :friendships, only: [:create]

  # Friendship Requests (platform-initiated friend requests via profile previews)
  resources :friendship_requests, only: [:index, :create, :destroy] do
    member do
      post :accept
      post :decline
    end
  end

  # Previews (limited profile previews for people you have mutual friends with)
  resources :previews, only: [:show]
end
