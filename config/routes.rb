Rails.application.routes.draw do
  resources :artifacts
  resources :company_projects
  devise_for :users
  root 'home#index'
    resources :members
    resources :company_projects
end
