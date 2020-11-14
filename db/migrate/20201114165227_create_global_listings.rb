class CreateGlobalListings < ActiveRecord::Migration[6.0]
  def change
    create_table :global_listings do |t|

      t.timestamps
    end
  end
end
