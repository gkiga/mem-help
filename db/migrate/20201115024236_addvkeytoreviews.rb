class Addvkeytoreviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :vkey, :bigint
  
  end
end
