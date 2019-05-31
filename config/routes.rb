Rails.application.routes.draw do
  resources :users
  get '/test', to: 'users#test'
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
