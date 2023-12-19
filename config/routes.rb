 Rails.application.routes.draw do
      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registraions: 'users/registraions'
      }

      # resources :companies

      namespace :api do
        namespace :v1 do
          resources :companies
        end
      end
    end