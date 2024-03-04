Rails.application.routes.draw do
  use_doorkeeper
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions'
  }

  root to: 'accounts#index'

  resources :accounts, only: [:edit, :update, :destroy] do
    collection do
      get :owner
    end
  end
  get '/accounts/current', to: 'accounts#current'
end
