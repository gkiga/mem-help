class CreateGlobals < ActiveRecord::Migration[6.0]
  def change
    create_table :globals do |t|
      t.boolean :acceptedFlag
      t.string :category
      t.boolean :completedFlag
      t.string :description
      t.string :learningPreference
      t.float :new_volunteer_hours
      t.integer :recipient
      t.string :recipient_name
      t.string :sender

      t.timestamps
    end
  end
end
