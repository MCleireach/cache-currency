Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :fixer_requests, only: [:create], path: '/fixer', controller: :fixer_requests
end
