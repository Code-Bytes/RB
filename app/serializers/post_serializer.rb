class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, 
  			 :created_at, :updated_at, :cached_votes_total, 
  			 :cached_votes_up, :cached_votes_down, :cached_votes_score
  has_one :user, only: [:username, :avatar, :id]
end

