Rails.application.routes.draw do
  # get 'blog/index'

  # get 'blog/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blog , only: [:index, :create]
end
