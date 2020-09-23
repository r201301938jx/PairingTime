Rails.application.routes.draw do
  # Admin

  devise_for :admins,
             path: '',
             path_names: {
               sign_in: 'admin/sign_in',
               sign_out: 'admin/sign_out',
             },
             controllers: {
               sessions: 'admins/sessions',
             }

  namespace :admin do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update] do
      collection do
        get '/search' => 'customers#search'
        get '/sort' => 'customers#sort'
      end
    end
    resources :pairs, only: [:index, :show, :destroy] do
      collection do
        get '/search' => 'pairs#search'
        get '/sort' => 'pairs#sort'
      end
    end
  end

  # Customer

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    omniauth_callbacks: 'customers/omniauth_callbacks',
  }

  devise_scope :customer do
    post 'customers/guest_sign_in' => 'customers/sessions#new_guest'
  end

  scope module: :customer do
    root 'homes#top'
    get 'about' => 'homes#about'
    get 'like_pairs' => 'likes#index'
    resources :customers, only: [:show, :edit, :update] do
      member do
        get 'quit'
        patch 'withdraw'
      end
      resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#follower', as: 'follows'
      get 'followers' => 'relationships#followed', as: 'followers'
    end
    resources :pairs do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      collection do
        get '/search' => 'pairs#search'
        get '/sort' => 'pairs#sort'
      end
    end
    resources :tags do
      get 'pairs' => 'pairs#tag_search'
    end
    resources :chats, only: [:show, :create]
    resources :contacts, only: [:new, :create]
    resources :notifications, only: [:index, :destroy] do
      collection do
        delete "/" => "notifications#destroy_all"
      end
    end
  end
end
