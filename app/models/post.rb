class Post < ActiveRecord::Base
  scope :recent, -> { order(created_at: :desc) }
  scope :top, -> {order(cached_votes_score: :desc)}
  paginates_per 15
  acts_as_votable
  acts_as_taggable
  acts_as_taggable_on :language, :level

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true
  validates :url, format: {with:/\.(png|jpg|gif|ai|eps|svg|pdf|ppt|avi|flv|mov|mp4|mpg|wmv)\z/, 
                           message: "not a valid url"},
                           unless: Proc.new { |a| a.url.blank? }

  def tag_names
    self.tags.map(&:name).join(", ")
  end

end
