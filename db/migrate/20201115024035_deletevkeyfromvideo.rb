class Deletevkeyfromvideo < ActiveRecord::Migration[6.0]
  def change
    remove_column :videos, :vkey
  end
end
