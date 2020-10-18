class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.integer :recipient_id
      t.bigint :user_id
      t.string :sender_name
      t.string :recipient_name

      t.timestamps
    end
  end
end
