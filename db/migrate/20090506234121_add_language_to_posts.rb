class AddLanguageToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :language_code, :string
  end

  def self.down
    remove_column :posts, :language_code
  end
end
