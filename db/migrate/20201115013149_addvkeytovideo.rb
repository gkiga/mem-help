class Addvkeytovideo < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :vkey, :bigint
  end
end
