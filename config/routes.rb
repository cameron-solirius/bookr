Rails.application.routes.draw do
  root 'books#landing'
  resources :books, only: [:create, :index, :new, :destroy, :show, :edit, :update]

  match '*unmatched', to: 'application#not_found', via: :all
 end