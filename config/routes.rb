Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :exams, only: [:index, :show, :new, :create, :destroy]

  resources :attempts, only: [:index, :show, :new, :create, :destroy, :update]

  root to: 'users#new'
end
