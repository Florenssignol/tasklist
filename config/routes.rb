Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  devise_for :admins
  namespace :admin do 
    resources :users
    resources :lists
  end 
  get '/admin', to: 'admins#index'
  resources :tags, only: [:index, :show, :edit, :update, :destroy]
  resources :lists, only: [:index, :new, :create, :edit, :update, :destroy] do 
    resources :tasks do
      member do
        get :mark_as_done
      end
  
      collection do
        get :archived
      end
    end
  end
  get '/search', to: 'tasks#search'
end
