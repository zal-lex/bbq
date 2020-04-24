Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root "events#index"

  resources :events do
    # Вложенный ресурс комментов
    # Нам понадобится два экшена: create и destroy
    resources :comments, only: [:create, :destroy]

    # вложенный ресурс подписок
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]

    post :show, on: :member
  end
  resources :users, only: [:show, :edit, :update]
end
