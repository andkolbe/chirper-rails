Rails.application.routes.draw do
  root "chirps#index"
  
  resources :chirps

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
