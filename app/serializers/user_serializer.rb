class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :username, 
  			 :github, :created_at, :updated_at, 
  			 :avatar, :company, :url, :location, 
  			 :follower_count, :following_count, 
  			 :public_gists, :hireable, :blog
end