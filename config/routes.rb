Rails.application.routes.draw do


  get 'bookmarks/new'
  get 'bookmarks/index'
  get 'bookmarks/edit'
  get 'bookmarks/show'
  root 'pages#home'

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
  end

  get 'users/edit'
  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
