Rails.application.routes.draw do

scope defaults: {format: 'json'} do 
  post 'auth/github', to: 'auth#github'

  get '/me', to: 'api#show'
  put '/me', to: 'api#update'

# Voting Routes
  resources :posts, except: [:new,:edit] do
    resources :comments, except: [:new,:edit], shallow: true do
      member do
        post '/reply', to: 'comments#reply'
      end
    end
    member do
      put '/like', to: 'posts#upvote'
      put '/dislike', to: 'posts#downvote'
    end
  end

# Tag Routes
  get 'tags/:name', to: 'tags#show', as: 'tagged_posts'

# User Routes

	get '/users', to: 'users#index'
	get '/users/:id', to: 'users#find'
	get '/users/:id/posts', to: 'users#posts'

end

end
