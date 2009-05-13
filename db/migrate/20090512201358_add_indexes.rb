class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :posts, :tag_id
    add_index :posts, :user_id
    
    add_index :posts_info, :post_id
  end

  def self.down
    remove_index :posts, :tag_id
    remove_index :posts, :user_id
    
    remove_index :posts_info, :post_id
  end
end
