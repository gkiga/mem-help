class AddUserIdToGlobals < ActiveRecord::Migration[6.0]
  def change
    add_column :globals, :user_id, :bigint
  end
end
