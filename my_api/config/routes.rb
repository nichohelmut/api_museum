Rails.application.routes.draw do
  root 'museums#index'
  resources :museums
end
