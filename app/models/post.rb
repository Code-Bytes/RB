class Post < ActiveRecord::Base  
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags
  validates :title, :content, presence: true
  validates :url, format: {with:/\.(png|jpg|gif|ai|eps|svg|pdf|ppt|avi|flv|mov|mp4|mpg|wmv)\z/, 
                           message: "not a valid url"}

  def tag_names
    self.tags.map(&:name).join(", ")
  end
end
