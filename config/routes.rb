Rails.application.routes.draw do
  devise_for :delivery_managers, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :delivery_managers
  resources :packages
  resources :couriers
end
