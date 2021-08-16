class EditCatsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :age, :integer, null: false
    add_column :cats, :color, :string, null: false
    add_column :cats, :name, :string, null: false
    add_column :cats, :sex, :string, null: false
    add_column :cats, :description, :text, null: false
    change_column_null :cats, :birth_date, false
  end
end
