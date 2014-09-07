Rails.application.routes.draw do
  root 'site#index'

  resources :words do
    get 'answers', on: :member
  end

  resources :users
end
