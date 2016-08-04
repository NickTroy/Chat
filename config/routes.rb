Rails.application.routes.draw do
  resources :rooms
  devise_for :users

  root to: 'rooms#index'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
