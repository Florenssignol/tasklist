Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :tasks do
    member do
      get :mark_as_done
    end

    collection do
      get :archived
    end
  end
  resources :tags
  resources :lists
end
