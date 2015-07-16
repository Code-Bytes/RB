class DropTags < ActiveRecord::Migration
  def change
  	drop_table :tags, force: :cascade
  	drop_table :post_tags, force: :cascade
  end
end
