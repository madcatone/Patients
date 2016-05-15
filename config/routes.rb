Rails.application.routes.draw do
  resources :comments
  resources :translates
  resources :patients
  root 'patients#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  #API
  #mount API => '/api'
  #mount V1::API => '/'
  #mount V1::BASE => '/'
  #mount GrapeSwaggerRails::Engine => '/swagger'
end
