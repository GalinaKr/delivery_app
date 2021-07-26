Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'couriers#index'

  resources :couriers do
    resources :packages do
      put :delivery_status
    end
  end
end
