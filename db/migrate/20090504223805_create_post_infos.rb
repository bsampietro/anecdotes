class CreatePostInfos < ActiveRecord::Migration
  def self.up
    create_table :posts_info do |t|
      t.references :post
      t.integer :votes, :default => 0
      t.text :voters_ips
    end
  end

  def self.down
    drop_table :posts_info
  end
end
