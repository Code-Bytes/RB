Rails.application.routes.draw do

scope defaults: {format: 'json'} do 
  post 'auth/github', to: 'auth#github'

  get '/me', to: 'api#show'
  put '/me', to: 'api#update'

# Post Routes
  get '/posts', to: 'posts#index'
  get '/user/:username/post/:id', to: 'posts#post'
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  get '/user/:username/post/:id/edit', to: 'posts#edit'
  put 'user/:username/post/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'

  # get '/posts/:id', to: 'posts#show'
  # get '/posts/:id/edit', to: 'posts#edit'
  # put '/posts/:id', to: 'posts#update'
end

end
