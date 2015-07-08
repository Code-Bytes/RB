class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :company, :string
  	add_column :users, :homepage, :string
  	add_column :users, :location, :string
  	add_column :users, :follower_count, :integer
  	add_column :users, :following_count, :integer
  	add_column :users, :public_gists, :integer
  	add_column :users, :hireable, :boolean
  end
end
