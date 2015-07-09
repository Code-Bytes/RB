Rails.application.routes.draw do

scope defaults: {format: 'json'} do 
  post 'auth/github', to: 'auth#github'

  get '/me', to: 'api#show'
  put '/me', to: 'api#update'

# Post Routes
  get '/posts', to: 'posts#index'
  get '/user/:username/posts/:id', to: 'posts#post'
  get '/posts/:id', to: 'posts#show'
  post '/posts', to: 'posts#create'
  put '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'
end

end
