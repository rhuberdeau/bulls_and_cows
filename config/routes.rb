Rails.application.routes.draw do
  resources :games do
    resources :guesses, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
