Rails.application.routes.draw do

scope defaults: {format: 'json'} do 
  post 'auth/github', to: 'auth#github'

  get '/me', to: 'api#show'
  put '/me', to: 'api#update'

# Post Routes
  get '/posts', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'
  post '/posts', to: 'posts#create'
  put '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'

# Voting Routes
  resources :posts do
    member do
      put 'posts/like', to: 'posts#upvote'
      put 'posts/dislike', to: 'posts#downvote'
    end

# User Routes

	get '/users', to: 'users#index'
	get '/users/:id', to: 'users#find'
	get '/users/:id/posts', to: 'users#posts'

end

end
