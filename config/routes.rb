Rails.application.routes.draw do
  root 'site#index'
  get '/end', to: 'site#end'
  get '/logout', to: 'site#logout'
  get '/start', to: 'site#start'

  resources :words do
    get 'answers', on: :member
  end

  resources :users
end
