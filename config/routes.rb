Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/index'
  get 'users/edit'
  get 'users/show'
 root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
