KodoTest::Application.routes.draw do

  devise_for :users
  resources :welcome, only: :index
  resources :dashboard, only: :index
  resources :farms
  resources :invitations
  resources :profiles

  root to: "dashboard#index"
  
end
