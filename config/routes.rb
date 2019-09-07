Rails.application.routes.draw do
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
end
