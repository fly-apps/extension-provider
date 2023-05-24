Rails.application.routes.draw do
  resources :sandwiches
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  root "sandwiches#index"
end
