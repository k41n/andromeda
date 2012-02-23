Andromeda::Application.routes.draw do
  root :to => 'sessions#new'

  resources :sessions
  resources :players do
    collection do
      post 'objects'
    end
  end

  resources :planets do
    member do
      get 'update_resources'
    end
    resources :buildings
  end

  resources :buildings do
    member do
      get 'upgrade'
      get 'begin_upgrading'
    end
  end

end
