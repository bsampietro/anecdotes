class AddVotesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :votes, :integer, :default => 0
  end

  def self.down
    remove_column :users, :votes
  end
end
