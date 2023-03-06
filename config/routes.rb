Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/products', to: 'products#index'
  get '/by_brand', to: 'products#by_brand'
end
