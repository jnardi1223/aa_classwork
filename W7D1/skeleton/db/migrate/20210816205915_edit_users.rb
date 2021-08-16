class EditUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :session_token, false 
  end
end
