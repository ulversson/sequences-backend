Rails.application.routes.draw do
  resources :users
    # Back admin routes start
    namespace :admin do
      resources :input_files, only: [:new, :create, :index, :destroy, :update]
      resources :processing_scripts, only: [:new, :create, :index, :destroy, :update]
      resources :processing_results

      resources :users
  
      # Admin root
      root to: 'application#index'
    end
    # Back admin routes end
  
    # Front routes start
    devise_for :users, only: [:session, :registration, :confirmation], path: 'session',
               path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
    # Application root
    root to: "application#index"
    # Front routes end
end
