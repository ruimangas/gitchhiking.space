Rails.application.routes.draw do
  get 'subscriptions/create'

  get 'subscriptions/destroy'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'stars/index'
  get 'stars/new'
  get 'stars/create'

  root to: 'stars#index'
  get '/auth/:provider/callback', to: 'subscriptions#create'
end
