Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  get 'sessions/index'

  get 'subscriptions/create'
  get 'subscriptions/index'
  delete 'subscriptions/destroy'

  root to: 'sessions#index'

  get '/auth/:provider/callback', to: 'sessions#create'
end
