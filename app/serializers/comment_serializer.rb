class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :parent_id

  has_one :user, only: [:id,:username,:avatar]

  has_one :post, only: [:id, :content]
end
