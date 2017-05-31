Rails.application.routes.draw do
  root :to => 'welcome#index'

  resources :users, only: [:new, :create] do
    resources :expenses, only: [:create, :destroy]
  end

  # resources :expenses, only: [:delete]
  # delete '/expenses/:id' => 'expenses#destroy', as: 'remove'
  
  get '/dashboard' => 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
