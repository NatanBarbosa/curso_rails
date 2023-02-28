Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  get '/inicio', to: 'welcome#index'
  root 'welcome#index'

  resources :coins
  #get /coins
  #get /coins/1
  #get /coins/new
  #get /coins/1/edit
  #post /coins
  #put /coins/1
  #delete /coins/1

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
