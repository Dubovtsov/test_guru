Rails.application.routes.draw do

  # devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  # get 'sessions/new'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
    resources :questions
    resources :answers
  end

end
