Rails.application.routes.draw do
  devise_for :users
  root to: "circles#index"
  resources :circles do
    get "joing"
    get "withdrawal"
    resources :articles, except: [:index]
    resources :events, only: [:new, :show, :create, :edit, :update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
