Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Clearly delineated namespace separated from the rest of the app and versioning
  namespace :api do
    namespace :v1 do
      resources :blog , only: [:index, :create, :destroy]
      resources :projects, except: [:show]

      post 'auth', to: 'authentication#create'
    end
  end
end
