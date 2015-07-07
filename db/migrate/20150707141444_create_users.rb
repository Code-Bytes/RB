class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :email, null: false, default: ''
    	t.string :password, null:false, default: ''
    	t.string :username
    	t.string :github

    	t.timestamps null:false
    end
    add_index :users, :email, unique: true
  end
end
