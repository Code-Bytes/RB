Rails.application.routes.draw do

scope defaults: {format: 'json'} do 
  post 'auth/github', to: 'auth#github'

  get '/me', to: 'api#show'
  put '/me', to: 'api#update'
end

end
