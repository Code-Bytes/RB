class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, 
  			 :created_at, :updated_at, :cached_votes_total, 
  			 :cached_votes_up, :cached_votes_down

  has_one :user, only: [:id]
end

