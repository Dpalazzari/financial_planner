Rails.application.routes.draw do
  root :to => 'welcome#index'

  resources :users, only: [:new, :create, :edit, :update] do
    resources :expenses, only: [:create]
  end

  delete '/expenses/:id' => 'expenses#destroy', as: 'remove'
  
  get '/dashboard' => 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
