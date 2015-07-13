class UserSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :email, :password, :username, 
  			 :github, :created_at, :updated_at, 
  			 :avatar, :company, :url, :location, 
  			 :follower_count, :following_count, 
  			 :public_gists, :hireable, :blog
end