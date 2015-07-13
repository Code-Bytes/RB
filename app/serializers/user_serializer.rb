class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :avatar, :company, :url, :blog, :location
end
