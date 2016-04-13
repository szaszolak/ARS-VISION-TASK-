Rails.application.routes.draw do
  root 'companies#index'

  get 'favorites'=>'favorite#index'
  post 'favorite/add_company'
  post 'favorite/add_employee'
  delete 'favorite/destroy_company'
  delete 'favorite/destroy_employee'

  devise_for :users

  resources :people, only: [:show]
  resources :companies, only: [:index, :show]
 
end
