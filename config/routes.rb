Rails.application.routes.draw do
  root 'site#index'
  get '/end', to: 'site#end'

  resources :words do
    get 'answers', on: :member
  end

  resources :users
end
