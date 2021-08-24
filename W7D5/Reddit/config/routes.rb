Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :index, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update]
  resources :subs
  resources :users do 
    resources :posts, only: [:edit, :update]
  end

end
