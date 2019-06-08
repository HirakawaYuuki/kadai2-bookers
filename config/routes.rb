Rails.application.routes.draw do
  get 'about/top'
  get 'books/update'
  devise_for :users
  root 'books#top'
  resources :books, only: [:new, :create, :show, :destroy, :edit, :index, :update]
  resources :users, only: [:new, :create, :show, :destroy, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
