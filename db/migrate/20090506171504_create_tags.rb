class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :ki
      t.integer :number_of_stories, :default => 0
    end
  end

  def self.down
    drop_table :tags
  end
end
