Rails.application.routes.draw do

  #Admin

  devise_for :admins,
    path: '',
    path_names: {
      sign_in: 'admin/sign_in',
      sign_out: 'admin/sign_out'
    },
    controllers: {
      sessions: 'admins/sessions'
    }

  namespace :admin do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
  end

  #Customer

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }

  root 'customer/homes#top'
  get 'about' => 'customer/homes#about'

  scope module: :customer do
    resources :customers, only: [:show, :edit, :update] do
      member do
        get 'quit'
        patch 'withdraw'
      end
    end
  end

end
