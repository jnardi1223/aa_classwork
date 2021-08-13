class RemoveArtworkId < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :artwork_id
  end
end
