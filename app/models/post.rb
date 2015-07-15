class Post < ActiveRecord::Base  
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
  validates :title, :content, presence: true
  validates :url, format: {with:/\.(png|jpg|gif|ai|eps|svg|pdf|ppt|avi|flv|mov|mp4|mpg|wmv)\z/, 
  						   message: "not a valid url"}
end
