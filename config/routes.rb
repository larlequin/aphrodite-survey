Rails.application.routes.draw do
  root 'site#index'
  resources :words#, :member => { :answer => :post }
  resources :users
end
