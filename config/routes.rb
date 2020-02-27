Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :ratings
  resources :dogs
  get "/" to "dogs#hi"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
