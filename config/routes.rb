Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/logout' => 'sessions#destroy', as: :logout
  get '/like' => 'ideas#like', as: :like
  get '/unlike' => 'ideas#unlike', as: :unlike

  resources :ideas, only: [:show, :create] do
    resources :comments, only: :create
  end

  match '*path' => 'application#error404', via: :all
end
