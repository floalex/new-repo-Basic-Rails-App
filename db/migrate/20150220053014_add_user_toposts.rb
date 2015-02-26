class AddUserToposts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :published
    add_index :posts, :user_id
  end
end
