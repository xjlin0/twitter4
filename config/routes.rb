Rails.application.routes.draw do
  devise_for :users

  root to: 'visitors#index'

  get '/search' => 'users#search'
  
  resources :posts, except: [:create]
  post '/posts' => 'posts#create', as: 'create_post'
  get  '/posts/:id/vote' => 'posts#vote', as:'vote_post'

  resources :users, only: [:index, :show] do
  	resources :followships, only: [:index, :destroy]
  	post '/followships' => 'followships#create', as: 'new_followship'
  	delete '/followships' => 'followships#destroy', as: 'remove_followship'
  end
end
