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
    resources :customers, only: [:index, :show, :edit, :update]
    resources :pairs, only: [:index, :show, :destroy]
  end

  # Customer

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
  }

  scope module: :customer do
    root 'homes#top'
    get 'about' => 'homes#about'
    get 'like_pairs' => 'likes#index'
    get 'chat/:id' => 'chats#show', as: 'chat'
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
    end
    resources :tags do
      get 'pairs' => 'pairs#search'
    end
    resources :chats, only: [:create]
  end
end
