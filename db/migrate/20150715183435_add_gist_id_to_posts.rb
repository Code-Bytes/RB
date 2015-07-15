class AddGistIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :gist_id, :string
    add_index :posts, :gist_id
  end
end
