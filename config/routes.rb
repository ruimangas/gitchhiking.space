Rails.application.routes.draw do
  get 'subscriptions/create'
  delete 'subscriptions/destroy'

  root to: 'subscriptions#index'

  get '/auth/:provider/callback', to: 'subscriptions#create'
end
