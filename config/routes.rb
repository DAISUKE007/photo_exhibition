Rails.application.routes.draw do
  devise_for :users
  root "photos#index"
  resources :photos, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'dComplete'
    end
  end
end