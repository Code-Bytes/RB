Rails.application.routes.draw do

scope defaults: {format: 'json'} do 
  post 'auth/github', to: 'auth#github'

  get '/me', to: 'api#show'
  put '/me', to: 'api#update'

# Voting Routes
  resources :posts do
    member do
      put '/like', to: 'posts#upvote'
      put '/dislike', to: 'posts#downvote'
      get '/:cached_votes_total', to: 'posts#show'
      get '/:cached_votes_up', to: 'posts#show'
      get '/:cached_votes_down', to: 'posts#show'
    end
  end

# User Routes

	get '/users', to: 'users#index'
	get '/users/:id', to: 'users#find'
	get '/users/:id/posts', to: 'users#posts'

end

end
