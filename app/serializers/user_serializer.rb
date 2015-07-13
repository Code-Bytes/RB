class UserSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :username, :email

  #how do these work??
  
end