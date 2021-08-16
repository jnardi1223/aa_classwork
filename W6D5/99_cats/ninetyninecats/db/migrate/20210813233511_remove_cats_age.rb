class RemoveCatsAge < ActiveRecord::Migration[5.2]
  def change
    remove_column :cats, :age
  end
end
