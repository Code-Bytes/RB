class PostSerializer < ActiveModel::Serializer
	
  attributes :id, 
  :title, 
  :content, 
  :user_id, 
  :gist_id, 
  :created_at, 
  :updated_at, 
  :cached_votes_total, 
  :cached_votes_up, 
  :cached_votes_down, 
  :cached_votes_score, 
  :comment_number,
  :voted_for

  has_one :user, 
  only: [:username, :avatar, :id]

  has_many :tags

  def tags
  	object.tag_list
  end

  def comment_number
  	object.comments.count
  end

  def voted_for
    scope.voted_as_when_voted_for(object) if scope
  end

end

