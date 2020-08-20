Rails.application.routes.draw do
  devise_for :users
  root to: "circles#index"
  resources :circles do
    resources :articles
    get "joing"
    get "withdrawal"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
