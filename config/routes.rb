Track::Application.routes.draw do
  root :to => 'items#index'
  resources :sessions, :only => [:new, :create]
  resources :users, :only => [:new, :create]
  resources :items, :except => [:show] do
    resources :traces, :except => [:show]
  end

  delete 'sessions', :to => 'sessions#destroy', :as => 'session'
  resources :items
end
