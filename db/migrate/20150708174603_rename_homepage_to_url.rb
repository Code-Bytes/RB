class RenameHomepageToUrl < ActiveRecord::Migration
  def change
  	rename_column :users, :homepage, :url
  end
end
