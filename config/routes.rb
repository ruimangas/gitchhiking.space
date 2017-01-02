Rails.application.routes.draw do
  get 'stars/index'

  get 'stars/new'

  get 'stars/create'

  root to: 'stars#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
