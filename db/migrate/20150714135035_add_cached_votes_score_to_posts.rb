class AddCachedVotesScoreToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :cached_votes_score, :integer, :default => 0
    add_index :posts, :cached_votes_score
  end
end
