class MakeChanges < ActiveRecord::Migration[5.2]
  def change
    remove_index :artworks, :artist_id
    add_index :users, :username, unique: true 
  end
end
