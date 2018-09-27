Rails.application.routes.draw do

  root 'pages#home'

  get '/browse' => 'pages#browse'
  get '/events' => 'pages#events'
  get '/events/city' => 'pages#events_by_city'
    get '/events/state' => 'pages#events_by_state'
      get '/events/all' => 'pages#events_all'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/users' => 'users#index'
  get '/register' => 'users#new'

  resources :users, only: %i[edit index create show update destroy] do
    delete '/delete' => 'users#destroy'
    resources :profiles do
      delete '/delete' => 'profiles#destroy'
    end
    resources :bookmarks do
      delete '/delete' => 'bookmarks#destroy'
    end
    resources :events do
      delete '/delete' => 'events#destroy'
      get '/artists' => 'pages#artists'
      resources :locations do
            delete '/delete' => 'locations#destroy'
            resources :listings do
                  delete '/delete' => 'listings#destroy'
            end
      end
    end
  end

  get 'users/edit'
  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
