Rails.application.routes.draw do
  get 'subscriptions/create'
  get 'subscriptions/destroy'

  root to: 'stars#index'

  get '/auth/:provider/callback', to: 'subscriptions#create'
end
