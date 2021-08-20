class CreatePostSub < ActiveRecord::Migration[5.2]
  def change
    create_table :postsubs do |t|
      t.integer :post_id, null: false 
      t.integer :sub_id, null: false 
      
      t.timestamps
    end
    add_index :postsubs, :post_id, :sub_id, unique: true 
  end
end
