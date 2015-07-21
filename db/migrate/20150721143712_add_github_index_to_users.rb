class AddGithubIndexToUsers < ActiveRecord::Migration
  def change
  	add_index :users, :github, unique: true
  end
end
