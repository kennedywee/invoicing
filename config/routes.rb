Rails.application.routes.draw do
  resources :lines
  resources :quotations
  resources :customers
  root 'main/posts#index'
  resources :posts

  devise_for :users,
             path: 'user',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               sign_up: 'register',
               password: 'forgot'
             }

  devise_for :admins,
             path: 'admin',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               sign_up: 'register',
               password: 'forgot'
             }

  namespace :main do
    root 'posts#index'
    resources :posts
  end

  namespace :portal do
    root 'quotations#index'
    resources :quotations
  end

  namespace :admin do
    resources :quotations
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
