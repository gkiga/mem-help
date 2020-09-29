class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :description
      t.string :category
      t.string :learningPreference
      t.string :recipient
      t.string :sender
      t.boolean :acceptedFlag
      t.boolean :completedFlag

      t.timestamps
    end
  end
end
