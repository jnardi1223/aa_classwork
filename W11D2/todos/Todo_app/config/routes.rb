Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#root'
  
  namespace :api, default: {format: :json} do
    resources :todo_items, only: [:index, :show, :create, :destroy, :update]
  end
end
