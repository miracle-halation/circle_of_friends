Rails.application.routes.draw do
  devise_for :users
  root to: "circles#index"
  resources :circles do
    get "joing"
    get "withdrawal"
    get "article"
  end
  resources :articles, only: [:new, :show, :edit, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
