Rails.application.routes.draw do
  devise_for :users
  root to: "circles#index"
  resources :circles do
    get "joing"
    get "withdrawal"
    resources :articles, only: [:new, :show, :create]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
